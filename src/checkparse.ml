(* see PR#7200 *)
let report_err exn =
  match exn with
    | Sys_error msg ->
        Format.printf "@[I/O error:@ %s@]@." msg
    | x ->
        match Location.error_of_exn x with
        | Some err ->
            Format.printf "@[%a@]@."
              Location.report_error err
        | None -> raise x

let remove_locs =
  let open Ast_mapper in
  { default_mapper with
    location = (fun _mapper _loc -> Location.none);
    attributes =
      (fun mapper attrs ->
         let attrs = default_mapper.attributes mapper attrs in
         List.filter (fun (s, _) -> s.Location.txt <> "#punning#") attrs (* this is to accomodate a LexiFi custom extension *)
      )
  }

let from_file parse_fun filename =
  Location.input_name := filename;
  let ic = open_in filename in
  let lexbuf = Lexing.from_channel ic in
  Location.init lexbuf filename;
  let ast = parse_fun lexbuf in
  close_in ic;
  ast

let from_string parse_fun str =
  Location.input_name := "<str>";
  let lexbuf = Lexing.from_string str in
  Location.init lexbuf "<str>";
  parse_fun lexbuf

let to_string print_fun ast =
  Format.fprintf Format.str_formatter "%a@." print_fun ast;
  Format.flush_str_formatter ()

let to_tmp_file print_fun ast =
  let fn, oc = Filename.open_temp_file "ocamlparse" ".txt" in
  output_string oc (to_string print_fun ast);
  close_out oc;
  fn

let test parse_fun pprint print map filename =
  match from_file parse_fun filename with
  | exception exn ->
      Printf.printf "%s: FAIL, CANNOT PARSE\n" filename;
      report_err exn;
      print_endline "====================================================="
  | ast ->
      let str = to_string pprint ast in
      match from_string parse_fun str with
      | exception exn ->
          Printf.printf "%s: FAIL, CANNOT REPARSE\n" filename;
          report_err exn;
          print_endline str;
          print_endline "====================================================="
      | ast2 ->
          let ast = map remove_locs remove_locs ast in
          let ast2 = map remove_locs remove_locs ast2 in
          if ast <> ast2 then begin
            Printf.printf "%s:  FAIL, REPARSED AST IS DIFFERENT\n%!" filename;
            let f1 = to_tmp_file print ast in
            let f2 = to_tmp_file print ast2 in
            let cmd = Printf.sprintf "diff -u %s %s" (Filename.quote f1) (Filename.quote f2) in
            let _ret = Sys.command cmd in
            Sys.remove f1;
            Sys.remove f2;
            print_endline "====================================================="
          end

let test parse_fun pprint print map filename =
  try test parse_fun pprint print map filename
  with exn -> report_err exn

let rec process path =
  if Sys.is_directory path then
    let files = Sys.readdir path in
    Array.iter (fun s -> process (Filename.concat path s)) files
  else if Filename.check_suffix path ".ml" then
    test
(*
      (fun lexbuf -> List.filter (fun x -> x <> Parsetree.Ptop_def [])
          (Parse.use_file lexbuf))
      (fun ppf -> List.iter (Format.fprintf ppf "%a@." Pprintast.toplevel_phrase))
      (fun ppf -> List.iter (Printast.top_phrase ppf))
      (fun mapper _ ->
         List.map
           (function
             | Parsetree.Ptop_dir _ as d -> d
             | Parsetree.Ptop_def str -> Ptop_def (mapper.structure mapper str)
           )
      )
*)
      Parse.implementation
      Pprintast.structure
      Printast.implementation
      (fun mapper -> mapper.Ast_mapper.structure)
      path
  else if Filename.check_suffix path ".mli" then
    test
      Parse.interface
      Pprintast.signature
      Printast.interface
      (fun mapper -> mapper.Ast_mapper.signature)
      path

let () =
  for i = 1 to Array.length Sys.argv - 1 do
    process (Array.get Sys.argv i)
  done
