type token =
  | Tident of (string)
  | Tchar of (char)
  | Tstring of (string)
  | Taction of (Syntax.location)
  | Trule
  | Tparse
  | Tand
  | Tequal
  | Tend
  | Tor
  | Tunderscore
  | Teof
  | Tlbracket
  | Trbracket
  | Tstar
  | Tmaybe
  | Tplus
  | Tlparen
  | Trparen
  | Tcaret
  | Tdash

open Parsing;;
let _ = parse_error;;
# 19 "grammar.mly"
open Syntax
open Gram_aux
# 30 "grammar.ml"
let yytransl_const = [|
  261 (* Trule *);
  262 (* Tparse *);
  263 (* Tand *);
  264 (* Tequal *);
  265 (* Tend *);
  266 (* Tor *);
  267 (* Tunderscore *);
  268 (* Teof *);
  269 (* Tlbracket *);
  270 (* Trbracket *);
  271 (* Tstar *);
  272 (* Tmaybe *);
  273 (* Tplus *);
  274 (* Tlparen *);
  275 (* Trparen *);
  276 (* Tcaret *);
  277 (* Tdash *);
    0|]

let yytransl_block = [|
  257 (* Tident *);
  258 (* Tchar *);
  259 (* Tstring *);
  260 (* Taction *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\004\000\004\000\003\000\005\000\007\000\
\007\000\006\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\008\000\008\000\008\000\009\000\009\000\010\000\
\010\000\010\000\000\000"

let yylen = "\002\000\
\005\000\001\000\000\000\003\000\000\000\003\000\003\000\003\000\
\000\000\002\000\001\000\001\000\001\000\001\000\003\000\002\000\
\002\000\002\000\003\000\002\000\003\000\002\000\001\000\003\000\
\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\027\000\000\000\000\000\000\000\005\000\
\000\000\000\000\000\000\006\000\000\000\001\000\013\000\014\000\
\011\000\012\000\000\000\000\000\009\000\000\000\004\000\000\000\
\000\000\000\000\023\000\000\000\000\000\010\000\000\000\016\000\
\017\000\018\000\000\000\000\000\000\000\022\000\015\000\000\000\
\021\000\000\000\000\000\024\000\008\000"

let yydgoto = "\002\000\
\004\000\005\000\008\000\010\000\012\000\021\000\029\000\035\000\
\040\000\027\000"

let yysindex = "\001\000\
\010\255\000\000\000\000\000\000\024\255\045\255\254\254\000\000\
\021\255\003\255\005\255\000\000\045\255\000\000\000\000\000\000\
\000\000\000\000\002\255\005\255\000\000\040\255\000\000\028\255\
\002\255\255\254\000\000\022\255\037\255\000\000\005\255\000\000\
\000\000\000\000\057\255\059\255\002\255\000\000\000\000\002\255\
\000\000\005\255\057\255\000\000\000\000"

let yyrindex = "\000\000\
\060\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\255\
\000\000\000\000\000\000\000\000\019\255\000\000\000\000\000\000\
\000\000\000\000\026\255\000\000\000\000\000\000\000\000\048\255\
\000\000\000\000\044\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\051\000\000\000\000\000\024\000\000\000\245\255\
\242\255\042\000"

let yytablesize = 75
let yytable = "\022\000\
\024\000\001\000\025\000\024\000\026\000\009\000\015\000\016\000\
\028\000\013\000\037\000\014\000\039\000\003\000\025\000\017\000\
\018\000\019\000\025\000\043\000\025\000\025\000\020\000\015\000\
\016\000\007\000\011\000\007\000\006\000\020\000\022\000\031\000\
\017\000\018\000\019\000\020\000\032\000\033\000\034\000\020\000\
\041\000\015\000\016\000\030\000\020\000\007\000\042\000\019\000\
\036\000\031\000\017\000\018\000\019\000\019\000\032\000\033\000\
\034\000\020\000\015\000\016\000\044\000\026\000\019\000\023\000\
\003\000\045\000\038\000\017\000\018\000\019\000\000\000\032\000\
\033\000\034\000\020\000"

let yycheck = "\011\000\
\002\001\001\000\002\001\002\001\019\000\008\001\002\001\003\001\
\020\000\007\001\025\000\009\001\014\001\004\001\014\001\011\001\
\012\001\013\001\020\001\031\000\020\001\020\001\018\001\002\001\
\003\001\007\001\006\001\009\001\005\001\004\001\042\000\010\001\
\011\001\012\001\013\001\010\001\015\001\016\001\017\001\018\001\
\019\001\002\001\003\001\004\001\019\001\001\001\010\001\004\001\
\021\001\010\001\011\001\012\001\013\001\010\001\015\001\016\001\
\017\001\018\001\002\001\003\001\002\001\014\001\019\001\013\000\
\005\001\042\000\025\000\011\001\012\001\013\001\255\255\015\001\
\016\001\017\001\018\001"

let yynames_const = "\
  Trule\000\
  Tparse\000\
  Tand\000\
  Tequal\000\
  Tend\000\
  Tor\000\
  Tunderscore\000\
  Teof\000\
  Tlbracket\000\
  Trbracket\000\
  Tstar\000\
  Tmaybe\000\
  Tplus\000\
  Tlparen\000\
  Trparen\000\
  Tcaret\000\
  Tdash\000\
  "

let yynames_block = "\
  Tident\000\
  Tchar\000\
  Tstring\000\
  Taction\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'header) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'definition) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'other_definitions) in
    Obj.repr(
# 43 "grammar.mly"
        ( Lexdef(_1, _3::(List.rev _4)) )
# 163 "grammar.ml"
               : Syntax.lexer_definition))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Syntax.location) in
    Obj.repr(
# 47 "grammar.mly"
        ( _1 )
# 170 "grammar.ml"
               : 'header))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "grammar.mly"
        ( Location(0,0) )
# 176 "grammar.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'other_definitions) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'definition) in
    Obj.repr(
# 53 "grammar.mly"
        ( _3::_1 )
# 184 "grammar.ml"
               : 'other_definitions))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "grammar.mly"
        ( [] )
# 190 "grammar.ml"
               : 'other_definitions))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'entry) in
    Obj.repr(
# 59 "grammar.mly"
        ( (_1,_3) )
# 198 "grammar.ml"
               : 'definition))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'case) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'rest_of_entry) in
    Obj.repr(
# 63 "grammar.mly"
        ( _2 :: List.rev _3 )
# 206 "grammar.ml"
               : 'entry))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'rest_of_entry) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'case) in
    Obj.repr(
# 67 "grammar.mly"
        ( _3::_1 )
# 214 "grammar.ml"
               : 'rest_of_entry))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "grammar.mly"
        ( [] )
# 220 "grammar.ml"
               : 'rest_of_entry))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regexp) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Syntax.location) in
    Obj.repr(
# 73 "grammar.mly"
        ( (_1,_2) )
# 228 "grammar.ml"
               : 'case))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "grammar.mly"
        ( Characters all_chars )
# 234 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    Obj.repr(
# 79 "grammar.mly"
        ( Characters ['\000'] )
# 240 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 81 "grammar.mly"
        ( Characters [_1] )
# 247 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 83 "grammar.mly"
        ( regexp_for_string _1 )
# 254 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'char_class) in
    Obj.repr(
# 85 "grammar.mly"
        ( Characters _2 )
# 261 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regexp) in
    Obj.repr(
# 87 "grammar.mly"
        ( Repetition _1 )
# 268 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regexp) in
    Obj.repr(
# 89 "grammar.mly"
        ( Alternative(_1, Epsilon) )
# 275 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regexp) in
    Obj.repr(
# 91 "grammar.mly"
        ( Sequence(_1, Repetition _1) )
# 282 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'regexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'regexp) in
    Obj.repr(
# 93 "grammar.mly"
        ( Alternative(_1,_3) )
# 290 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'regexp) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'regexp) in
    Obj.repr(
# 95 "grammar.mly"
        ( Sequence(_1,_2) )
# 298 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'regexp) in
    Obj.repr(
# 97 "grammar.mly"
        ( _2 )
# 305 "grammar.ml"
               : 'regexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'char_class1) in
    Obj.repr(
# 101 "grammar.mly"
        ( subtract all_chars _2 )
# 312 "grammar.ml"
               : 'char_class))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'char_class1) in
    Obj.repr(
# 103 "grammar.mly"
        ( _1 )
# 319 "grammar.ml"
               : 'char_class))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : char) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 107 "grammar.mly"
        ( char_class _1 _3 )
# 327 "grammar.ml"
               : 'char_class1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char) in
    Obj.repr(
# 109 "grammar.mly"
        ( [_1] )
# 334 "grammar.ml"
               : 'char_class1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'char_class) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'char_class) in
    Obj.repr(
# 111 "grammar.mly"
        ( _1 @ _2 )
# 342 "grammar.ml"
               : 'char_class1))
(* Entry lexer_definition *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let lexer_definition (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Syntax.lexer_definition)
;;
