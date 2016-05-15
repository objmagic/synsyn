type token =
  | ABSF
  | ADDA
  | ADDF
  | ADDI
  | ADDV
  | ADDR
  | ALIGN
  | ALLOC
  | AND
  | APPLY
  | ASR
  | ASSIGN
  | BYTE
  | CASE
  | CATCH
  | CHECKBOUND
  | COLON
  | DIVF
  | DIVI
  | EOF
  | EQA
  | EQF
  | EQI
  | EXIT
  | EXTCALL
  | FLOAT
  | FLOAT32
  | FLOAT64
  | FLOATCONST of (string)
  | FLOATOFINT
  | FUNCTION
  | GEA
  | GEF
  | GEI
  | GTA
  | GTF
  | GTI
  | HALF
  | IDENT of (string)
  | IF
  | INT
  | INT32
  | INTCONST of (int)
  | INTOFFLOAT
  | KSTRING
  | LBRACKET
  | LEA
  | LEF
  | LEI
  | LET
  | LOAD
  | LPAREN
  | LSL
  | LSR
  | LTA
  | LTF
  | LTI
  | MODI
  | MULF
  | MULH
  | MULI
  | NEA
  | NEF
  | NEI
  | OR
  | POINTER of (int)
  | PROJ
  | RAISE of (Lambda.raise_kind)
  | RBRACKET
  | RPAREN
  | SEQ
  | SIGNED
  | SKIP
  | STAR
  | STORE
  | STRING of (string)
  | SUBF
  | SUBI
  | SWITCH
  | TRY
  | UNIT
  | UNSIGNED
  | VAL
  | WHILE
  | WITH
  | XOR
  | ADDRAREF
  | INTAREF
  | FLOATAREF
  | ADDRASET
  | INTASET
  | FLOATASET

open Parsing;;
let _ = parse_error;;
# 19 "parsecmm.mly"
open Cmm
open Parsecmmaux

let rec make_letdef def body =
  match def with
    [] -> body
  | (id, def) :: rem ->
      unbind_ident id;
      Clet(id, def, make_letdef rem body)

let make_switch n selector caselist =
  let index = Array.make n 0 in
  let casev = Array.of_list caselist in
  let actv = Array.make (Array.length casev) (Cexit(0,[])) in
  for i = 0 to Array.length casev - 1 do
    let (posl, e) = casev.(i) in
    List.iter (fun pos -> index.(pos) <- i) posl;
    actv.(i) <- e
  done;
  Cswitch(selector, index, actv)

let access_array base numelt size =
  match numelt with
    Cconst_int 0 -> base
  | Cconst_int n -> Cop(Cadda, [base; Cconst_int(n * size)])
  | _ -> Cop(Cadda, [base;
                     Cop(Clsl, [numelt; Cconst_int(Misc.log2 size)])])

# 127 "parsecmm.ml"
let yytransl_const = [|
  257 (* ABSF *);
  258 (* ADDA *);
  259 (* ADDF *);
  260 (* ADDI *);
  261 (* ADDV *);
  262 (* ADDR *);
  263 (* ALIGN *);
  264 (* ALLOC *);
  265 (* AND *);
  266 (* APPLY *);
  267 (* ASR *);
  268 (* ASSIGN *);
  269 (* BYTE *);
  270 (* CASE *);
  271 (* CATCH *);
  272 (* CHECKBOUND *);
  273 (* COLON *);
  274 (* DIVF *);
  275 (* DIVI *);
    0 (* EOF *);
  276 (* EQA *);
  277 (* EQF *);
  278 (* EQI *);
  279 (* EXIT *);
  280 (* EXTCALL *);
  281 (* FLOAT *);
  282 (* FLOAT32 *);
  283 (* FLOAT64 *);
  285 (* FLOATOFINT *);
  286 (* FUNCTION *);
  287 (* GEA *);
  288 (* GEF *);
  289 (* GEI *);
  290 (* GTA *);
  291 (* GTF *);
  292 (* GTI *);
  293 (* HALF *);
  295 (* IF *);
  296 (* INT *);
  297 (* INT32 *);
  299 (* INTOFFLOAT *);
  300 (* KSTRING *);
  301 (* LBRACKET *);
  302 (* LEA *);
  303 (* LEF *);
  304 (* LEI *);
  305 (* LET *);
  306 (* LOAD *);
  307 (* LPAREN *);
  308 (* LSL *);
  309 (* LSR *);
  310 (* LTA *);
  311 (* LTF *);
  312 (* LTI *);
  313 (* MODI *);
  314 (* MULF *);
  315 (* MULH *);
  316 (* MULI *);
  317 (* NEA *);
  318 (* NEF *);
  319 (* NEI *);
  320 (* OR *);
  322 (* PROJ *);
  324 (* RBRACKET *);
  325 (* RPAREN *);
  326 (* SEQ *);
  327 (* SIGNED *);
  328 (* SKIP *);
  329 (* STAR *);
  330 (* STORE *);
  332 (* SUBF *);
  333 (* SUBI *);
  334 (* SWITCH *);
  335 (* TRY *);
  336 (* UNIT *);
  337 (* UNSIGNED *);
  338 (* VAL *);
  339 (* WHILE *);
  340 (* WITH *);
  341 (* XOR *);
  342 (* ADDRAREF *);
  343 (* INTAREF *);
  344 (* FLOATAREF *);
  345 (* ADDRASET *);
  346 (* INTASET *);
  347 (* FLOATASET *);
    0|]

let yytransl_block = [|
  284 (* FLOATCONST *);
  294 (* IDENT *);
  298 (* INTCONST *);
  321 (* POINTER *);
  323 (* RAISE *);
  331 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\002\000\004\000\004\000\006\000\007\000\
\007\000\009\000\009\000\009\000\009\000\008\000\008\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\012\000\012\000\011\000\011\000\018\000\018\000\
\017\000\019\000\019\000\019\000\019\000\019\000\019\000\019\000\
\019\000\019\000\019\000\019\000\013\000\013\000\013\000\013\000\
\013\000\013\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\005\000\
\005\000\015\000\015\000\020\000\020\000\016\000\003\000\021\000\
\021\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
\022\000\022\000\022\000\022\000\022\000\022\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\008\000\002\000\000\000\003\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\001\000\
\001\000\001\000\001\000\001\000\002\000\005\000\005\000\006\000\
\006\000\004\000\005\000\004\000\005\000\004\000\006\000\006\000\
\005\000\006\000\001\000\007\000\005\000\005\000\005\000\006\000\
\006\000\006\000\002\000\000\000\001\000\003\000\000\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\001\000\
\001\000\001\000\001\000\001\000\002\000\001\000\001\000\001\000\
\001\000\001\000\002\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\002\000\
\001\000\003\000\000\000\004\000\003\000\001\000\003\000\002\000\
\000\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\000\000\127\000\001\000\002\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\111\000\000\000\000\000\000\000\112\000\000\000\
\121\000\120\000\126\000\116\000\119\000\117\000\118\000\115\000\
\124\000\125\000\114\000\123\000\122\000\000\000\000\000\000\000\
\000\000\000\000\005\000\011\000\013\000\012\000\008\000\010\000\
\007\000\000\000\014\000\035\000\017\000\020\000\016\000\000\000\
\000\000\019\000\018\000\000\000\000\000\000\000\021\000\066\000\
\085\000\093\000\068\000\086\000\062\000\073\000\000\000\078\000\
\000\000\000\000\102\000\095\000\071\000\087\000\096\000\079\000\
\000\000\063\000\092\000\101\000\084\000\091\000\100\000\083\000\
\000\000\064\000\090\000\099\000\082\000\000\000\000\000\076\000\
\077\000\089\000\098\000\081\000\072\000\094\000\103\000\070\000\
\088\000\097\000\080\000\074\000\065\000\000\000\000\000\000\000\
\069\000\000\000\000\000\000\000\075\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\004\000\104\000\015\000\
\044\000\000\000\000\000\044\000\000\000\000\000\000\000\000\000\
\045\000\057\000\060\000\058\000\059\000\056\000\000\000\000\000\
\061\000\000\000\067\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\049\000\000\000\000\000\000\000\
\051\000\053\000\055\000\050\000\052\000\054\000\030\000\026\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\028\000\000\000\000\000\043\000\023\000\000\000\
\000\000\000\000\048\000\046\000\022\000\027\000\000\000\000\000\
\000\000\110\000\000\000\033\000\037\000\038\000\039\000\000\000\
\000\000\000\000\029\000\024\000\034\000\025\000\031\000\000\000\
\032\000\000\000\000\000\040\000\041\000\042\000\000\000\106\000\
\036\000\108\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\039\000\060\000\040\000\049\000\050\000\
\051\000\061\000\136\000\160\000\124\000\125\000\200\000\203\000\
\166\000\167\000\145\000\201\000\009\000\023\000"

let yysindex = "\015\000\
\001\000\000\000\000\000\244\254\000\000\000\000\000\000\201\254\
\253\254\228\254\219\254\238\254\240\254\005\255\006\255\008\255\
\034\255\236\254\000\000\015\255\051\255\226\254\000\000\033\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\063\255\014\255\033\255\
\252\254\214\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\013\255\000\000\000\000\000\000\000\000\000\000\023\255\
\142\255\000\000\000\000\029\255\214\255\003\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\214\255\000\000\
\069\255\214\255\000\000\000\000\000\000\000\000\000\000\000\000\
\031\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\214\255\000\000\000\000\000\000\000\000\224\254\209\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\214\255\209\255\214\255\
\000\000\066\255\214\255\214\255\000\000\214\255\214\255\214\255\
\214\255\214\255\214\255\214\255\214\255\000\000\000\000\000\000\
\000\000\214\255\026\255\000\000\214\255\214\255\073\255\214\255\
\000\000\000\000\000\000\000\000\000\000\000\000\250\254\068\255\
\000\000\043\255\000\000\090\255\214\255\030\255\214\255\214\255\
\214\255\214\255\214\255\214\255\214\255\046\255\214\255\002\255\
\047\255\214\255\002\255\214\255\000\000\073\255\048\255\050\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\052\255\106\255\084\255\054\255\058\255\060\255\061\255\214\255\
\214\255\214\255\000\000\062\255\064\255\000\000\000\000\065\255\
\067\255\070\255\000\000\000\000\000\000\000\000\095\255\079\255\
\214\255\000\000\214\255\000\000\000\000\000\000\000\000\080\255\
\087\255\098\255\000\000\000\000\000\000\000\000\000\000\121\255\
\000\000\106\255\099\255\000\000\000\000\000\000\106\255\000\000\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\201\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\100\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\100\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\233\254\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\018\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\101\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\101\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\103\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\103\255\000\000\000\000\000\000\000\000\216\255\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\139\000\195\255\000\000\110\255\000\000\
\118\000\196\255\000\000\050\000\000\000\000\000\221\255\000\000\
\090\000\020\000\076\000\226\255\000\000\000\000"

let yytablesize = 308
let yytable = "\127\000\
\003\000\044\000\011\000\012\000\025\000\134\000\169\000\044\000\
\044\000\013\000\129\000\036\000\131\000\189\000\009\000\001\000\
\193\000\008\000\135\000\010\000\045\000\014\000\024\000\027\000\
\052\000\028\000\045\000\045\000\133\000\053\000\170\000\105\000\
\029\000\015\000\171\000\046\000\016\000\026\000\017\000\054\000\
\018\000\046\000\046\000\055\000\037\000\009\000\056\000\030\000\
\146\000\031\000\032\000\148\000\057\000\150\000\033\000\151\000\
\034\000\152\000\153\000\154\000\155\000\156\000\157\000\158\000\
\159\000\019\000\058\000\035\000\020\000\161\000\038\000\021\000\
\164\000\165\000\168\000\047\000\059\000\048\000\022\000\041\000\
\172\000\047\000\042\000\048\000\048\000\062\000\105\000\177\000\
\178\000\180\000\063\000\181\000\182\000\183\000\184\000\185\000\
\186\000\126\000\188\000\190\000\192\000\105\000\190\000\194\000\
\173\000\132\000\130\000\149\000\174\000\162\000\134\000\175\000\
\052\000\179\000\187\000\191\000\196\000\053\000\197\000\199\000\
\198\000\202\000\204\000\208\000\209\000\210\000\205\000\054\000\
\206\000\207\000\211\000\055\000\212\000\213\000\056\000\214\000\
\216\000\223\000\215\000\218\000\057\000\219\000\064\000\065\000\
\066\000\067\000\068\000\217\000\220\000\069\000\070\000\071\000\
\072\000\073\000\058\000\221\000\074\000\075\000\176\000\076\000\
\077\000\078\000\079\000\080\000\059\000\081\000\222\000\225\000\
\006\000\047\000\082\000\107\000\083\000\084\000\085\000\086\000\
\087\000\088\000\043\000\128\000\089\000\163\000\224\000\137\000\
\090\000\195\000\147\000\091\000\092\000\093\000\094\000\095\000\
\226\000\096\000\097\000\098\000\099\000\100\000\101\000\102\000\
\103\000\104\000\105\000\106\000\107\000\108\000\113\000\113\000\
\109\000\000\000\000\000\110\000\000\000\113\000\138\000\111\000\
\000\000\112\000\113\000\114\000\115\000\000\000\000\000\000\000\
\116\000\113\000\117\000\118\000\119\000\120\000\121\000\122\000\
\123\000\139\000\140\000\141\000\052\000\113\000\109\000\000\000\
\113\000\053\000\113\000\109\000\113\000\000\000\000\000\000\000\
\142\000\000\000\000\000\054\000\000\000\109\000\000\000\055\000\
\000\000\109\000\056\000\000\000\109\000\000\000\000\000\000\000\
\057\000\000\000\109\000\000\000\000\000\113\000\000\000\000\000\
\113\000\000\000\000\000\113\000\000\000\000\000\058\000\143\000\
\109\000\000\000\113\000\000\000\000\000\000\000\000\000\000\000\
\059\000\144\000\109\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\004\000"

let yycheck = "\061\000\
\000\000\006\001\006\001\007\001\042\001\038\001\013\001\006\001\
\006\001\013\001\071\000\042\001\074\000\160\000\038\001\001\000\
\163\000\030\001\051\001\075\001\025\001\025\001\051\001\042\001\
\023\001\042\001\025\001\025\001\089\000\028\001\037\001\014\001\
\028\001\037\001\041\001\040\001\040\001\075\001\042\001\038\001\
\044\001\040\001\040\001\042\001\075\001\069\001\045\001\042\001\
\110\000\042\001\017\001\112\000\051\001\115\000\075\001\116\000\
\042\001\118\000\119\000\120\000\121\000\122\000\123\000\124\000\
\125\000\069\001\065\001\017\001\072\001\130\000\038\001\075\001\
\133\000\134\000\136\000\080\001\075\001\082\001\082\001\017\001\
\013\001\080\001\069\001\082\001\082\001\073\001\069\001\148\000\
\149\000\151\000\068\001\152\000\153\000\154\000\155\000\156\000\
\157\000\069\001\159\000\160\000\162\000\084\001\163\000\164\000\
\037\001\075\001\038\001\042\001\041\001\084\001\038\001\069\001\
\023\001\084\001\069\001\069\001\069\001\028\001\069\001\014\001\
\069\001\038\001\069\001\184\000\185\000\186\000\069\001\038\001\
\069\001\069\001\069\001\042\001\069\001\069\001\045\001\069\001\
\042\001\017\001\069\001\201\000\051\001\203\000\001\001\002\001\
\003\001\004\001\005\001\069\001\069\001\008\001\009\001\010\001\
\011\001\012\001\065\001\069\001\015\001\016\001\069\001\018\001\
\019\001\020\001\021\001\022\001\075\001\024\001\069\001\069\001\
\069\001\069\001\029\001\069\001\031\001\032\001\033\001\034\001\
\035\001\036\001\040\000\062\000\039\001\132\000\218\000\094\000\
\043\001\166\000\111\000\046\001\047\001\048\001\049\001\050\001\
\223\000\052\001\053\001\054\001\055\001\056\001\057\001\058\001\
\059\001\060\001\061\001\062\001\063\001\064\001\006\001\007\001\
\067\001\255\255\255\255\070\001\255\255\013\001\006\001\074\001\
\255\255\076\001\077\001\078\001\079\001\255\255\255\255\255\255\
\083\001\025\001\085\001\086\001\087\001\088\001\089\001\090\001\
\091\001\025\001\026\001\027\001\023\001\037\001\023\001\255\255\
\040\001\028\001\042\001\028\001\044\001\255\255\255\255\255\255\
\040\001\255\255\255\255\038\001\255\255\038\001\255\255\042\001\
\255\255\042\001\045\001\255\255\045\001\255\255\255\255\255\255\
\051\001\255\255\051\001\255\255\255\255\069\001\255\255\255\255\
\072\001\255\255\255\255\075\001\255\255\255\255\065\001\071\001\
\065\001\255\255\082\001\255\255\255\255\255\255\255\255\255\255\
\075\001\081\001\075\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\051\001"

let yynames_const = "\
  ABSF\000\
  ADDA\000\
  ADDF\000\
  ADDI\000\
  ADDV\000\
  ADDR\000\
  ALIGN\000\
  ALLOC\000\
  AND\000\
  APPLY\000\
  ASR\000\
  ASSIGN\000\
  BYTE\000\
  CASE\000\
  CATCH\000\
  CHECKBOUND\000\
  COLON\000\
  DIVF\000\
  DIVI\000\
  EOF\000\
  EQA\000\
  EQF\000\
  EQI\000\
  EXIT\000\
  EXTCALL\000\
  FLOAT\000\
  FLOAT32\000\
  FLOAT64\000\
  FLOATOFINT\000\
  FUNCTION\000\
  GEA\000\
  GEF\000\
  GEI\000\
  GTA\000\
  GTF\000\
  GTI\000\
  HALF\000\
  IF\000\
  INT\000\
  INT32\000\
  INTOFFLOAT\000\
  KSTRING\000\
  LBRACKET\000\
  LEA\000\
  LEF\000\
  LEI\000\
  LET\000\
  LOAD\000\
  LPAREN\000\
  LSL\000\
  LSR\000\
  LTA\000\
  LTF\000\
  LTI\000\
  MODI\000\
  MULF\000\
  MULH\000\
  MULI\000\
  NEA\000\
  NEF\000\
  NEI\000\
  OR\000\
  PROJ\000\
  RBRACKET\000\
  RPAREN\000\
  SEQ\000\
  SIGNED\000\
  SKIP\000\
  STAR\000\
  STORE\000\
  SUBF\000\
  SUBI\000\
  SWITCH\000\
  TRY\000\
  UNIT\000\
  UNSIGNED\000\
  VAL\000\
  WHILE\000\
  WITH\000\
  XOR\000\
  ADDRAREF\000\
  INTAREF\000\
  FLOATAREF\000\
  ADDRASET\000\
  INTASET\000\
  FLOATASET\000\
  "

let yynames_block = "\
  FLOATCONST\000\
  IDENT\000\
  INTCONST\000\
  POINTER\000\
  RAISE\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fundecl) in
    Obj.repr(
# 148 "parsecmm.mly"
                ( Cfunction _1 )
# 553 "parsecmm.ml"
               : Cmm.phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'datadecl) in
    Obj.repr(
# 149 "parsecmm.mly"
                ( Cdata _1 )
# 560 "parsecmm.ml"
               : Cmm.phrase))
; (fun __caml_parser_env ->
    Obj.repr(
# 150 "parsecmm.mly"
                ( raise End_of_file )
# 566 "parsecmm.ml"
               : Cmm.phrase))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 3 : 'params) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    Obj.repr(
# 154 "parsecmm.mly"
      ( List.iter (fun (id, ty) -> unbind_ident id) _5;
        {fun_name = _3; fun_args = _5; fun_body = _7; fun_fast = true;
         fun_dbg = Debuginfo.none} )
# 577 "parsecmm.ml"
               : 'fundecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'oneparam) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'params) in
    Obj.repr(
# 159 "parsecmm.mly"
                        ( _1 :: _2 )
# 585 "parsecmm.ml"
               : 'params))
; (fun __caml_parser_env ->
    Obj.repr(
# 160 "parsecmm.mly"
                        ( [] )
# 591 "parsecmm.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'machtype) in
    Obj.repr(
# 163 "parsecmm.mly"
                         ( (bind_ident _1, _3) )
# 599 "parsecmm.ml"
               : 'oneparam))
; (fun __caml_parser_env ->
    Obj.repr(
# 166 "parsecmm.mly"
                                ( [||] )
# 605 "parsecmm.ml"
               : 'machtype))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'componentlist) in
    Obj.repr(
# 167 "parsecmm.mly"
                                ( Array.of_list(List.rev _1) )
# 612 "parsecmm.ml"
               : 'machtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 170 "parsecmm.mly"
                                ( Val )
# 618 "parsecmm.ml"
               : 'component))
; (fun __caml_parser_env ->
    Obj.repr(
# 171 "parsecmm.mly"
                                ( Addr )
# 624 "parsecmm.ml"
               : 'component))
; (fun __caml_parser_env ->
    Obj.repr(
# 172 "parsecmm.mly"
                                ( Int )
# 630 "parsecmm.ml"
               : 'component))
; (fun __caml_parser_env ->
    Obj.repr(
# 173 "parsecmm.mly"
                                ( Float )
# 636 "parsecmm.ml"
               : 'component))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'component) in
    Obj.repr(
# 176 "parsecmm.mly"
                                 ( [_1] )
# 643 "parsecmm.ml"
               : 'componentlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'componentlist) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'component) in
    Obj.repr(
# 177 "parsecmm.mly"
                                 ( _3 :: _1 )
# 651 "parsecmm.ml"
               : 'componentlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 180 "parsecmm.mly"
                ( Cconst_int _1 )
# 658 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 181 "parsecmm.mly"
                ( Cconst_float (float_of_string _1) )
# 665 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 182 "parsecmm.mly"
                ( Cconst_symbol _1 )
# 672 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 183 "parsecmm.mly"
                ( Cconst_pointer _1 )
# 679 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 184 "parsecmm.mly"
                ( Cvar(find_ident _1) )
# 686 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 185 "parsecmm.mly"
                      ( Ctuple [] )
# 692 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'letdef) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    Obj.repr(
# 186 "parsecmm.mly"
                                      ( make_letdef _3 _4 )
# 700 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 187 "parsecmm.mly"
                                    ( Cassign(find_ident _3, _4) )
# 708 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'exprlist) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'machtype) in
    Obj.repr(
# 189 "parsecmm.mly"
                ( Cop(Capply(_5, Debuginfo.none), _3 :: List.rev _4) )
# 717 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'exprlist) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'machtype) in
    Obj.repr(
# 191 "parsecmm.mly"
                ( Cop(Cextcall(_3, _5, false, Debuginfo.none), List.rev _4) )
# 726 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 192 "parsecmm.mly"
                            ( Cop(Cnegf, [_3]) )
# 733 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 193 "parsecmm.mly"
                                 ( Cop(Csubf, [_3; _4]) )
# 741 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'unaryop) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 194 "parsecmm.mly"
                               ( Cop(_2, [_3]) )
# 749 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'binaryop) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 195 "parsecmm.mly"
                                     ( Cop(_2, [_3; _4]) )
# 758 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    Obj.repr(
# 196 "parsecmm.mly"
                               ( _3 )
# 765 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 197 "parsecmm.mly"
                                    ( Cifthenelse(_3, _4, _5) )
# 774 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'caselist) in
    Obj.repr(
# 198 "parsecmm.mly"
                                                ( make_switch _3 _4 _5 )
# 783 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    Obj.repr(
# 200 "parsecmm.mly"
      ( let body =
          match _3 with
            Cconst_int x when x <> 0 -> _4
          | _ -> Cifthenelse(_3, _4, (Cexit(0,[]))) in
        Ccatch(0, [], Cloop body, Ctuple []) )
# 795 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'sequence) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    Obj.repr(
# 205 "parsecmm.mly"
                                               ( Ccatch(0, [], _3, _5) )
# 803 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 206 "parsecmm.mly"
                ( Cexit(0,[]) )
# 809 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'sequence) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'bind_ident) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    Obj.repr(
# 208 "parsecmm.mly"
                ( unbind_ident _5; Ctrywith(_3, _5, _6) )
# 818 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 210 "parsecmm.mly"
      ( Cop(Cload Word_val, [access_array _3 _4 Arch.size_addr]) )
# 826 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 212 "parsecmm.mly"
      ( Cop(Cload Word_int, [access_array _3 _4 Arch.size_int]) )
# 834 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 214 "parsecmm.mly"
      ( Cop(Cload Double_u, [access_array _3 _4 Arch.size_float]) )
# 842 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 216 "parsecmm.mly"
      ( Cop(Cstore (Word_val, Assignment),
            [access_array _3 _4 Arch.size_addr; _5]) )
# 852 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 219 "parsecmm.mly"
      ( Cop(Cstore (Word_int, Assignment),
            [access_array _3 _4 Arch.size_int; _5]) )
# 862 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 222 "parsecmm.mly"
      ( Cop(Cstore (Double_u, Assignment),
            [access_array _3 _4 Arch.size_float; _5]) )
# 872 "parsecmm.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exprlist) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 226 "parsecmm.mly"
                                ( _2 :: _1 )
# 880 "parsecmm.ml"
               : 'exprlist))
; (fun __caml_parser_env ->
    Obj.repr(
# 227 "parsecmm.mly"
                                ( [] )
# 886 "parsecmm.ml"
               : 'exprlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'oneletdef) in
    Obj.repr(
# 230 "parsecmm.mly"
                                ( [_1] )
# 893 "parsecmm.ml"
               : 'letdef))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'letdefmult) in
    Obj.repr(
# 231 "parsecmm.mly"
                                ( _2 )
# 900 "parsecmm.ml"
               : 'letdef))
; (fun __caml_parser_env ->
    Obj.repr(
# 234 "parsecmm.mly"
                                ( [] )
# 906 "parsecmm.ml"
               : 'letdefmult))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'oneletdef) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'letdefmult) in
    Obj.repr(
# 235 "parsecmm.mly"
                                ( _1 :: _2 )
# 914 "parsecmm.ml"
               : 'letdefmult))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 238 "parsecmm.mly"
                                ( (bind_ident _1, _2) )
# 922 "parsecmm.ml"
               : 'oneletdef))
; (fun __caml_parser_env ->
    Obj.repr(
# 241 "parsecmm.mly"
                                ( Byte_unsigned )
# 928 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 242 "parsecmm.mly"
                                ( Byte_signed )
# 934 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 243 "parsecmm.mly"
                                ( Sixteen_unsigned )
# 940 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 244 "parsecmm.mly"
                                ( Sixteen_signed )
# 946 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 245 "parsecmm.mly"
                                ( Thirtytwo_unsigned )
# 952 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 246 "parsecmm.mly"
                                ( Thirtytwo_signed )
# 958 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 247 "parsecmm.mly"
                                ( Word_int )
# 964 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 248 "parsecmm.mly"
                                ( Word_val )
# 970 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 249 "parsecmm.mly"
                                ( Single )
# 976 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 250 "parsecmm.mly"
                                ( Double )
# 982 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    Obj.repr(
# 251 "parsecmm.mly"
                                ( Double_u )
# 988 "parsecmm.ml"
               : 'chunk))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'chunk) in
    Obj.repr(
# 255 "parsecmm.mly"
                                ( Cload _2 )
# 995 "parsecmm.ml"
               : 'unaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 256 "parsecmm.mly"
                                ( Calloc )
# 1001 "parsecmm.ml"
               : 'unaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 257 "parsecmm.mly"
                                ( Cfloatofint )
# 1007 "parsecmm.ml"
               : 'unaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 258 "parsecmm.mly"
                                ( Cintoffloat )
# 1013 "parsecmm.ml"
               : 'unaryop))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Lambda.raise_kind) in
    Obj.repr(
# 259 "parsecmm.mly"
                                ( Craise (_1, Debuginfo.none) )
# 1020 "parsecmm.ml"
               : 'unaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 260 "parsecmm.mly"
                                ( Cabsf )
# 1026 "parsecmm.ml"
               : 'unaryop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'chunk) in
    Obj.repr(
# 263 "parsecmm.mly"
                                ( Cstore (_2, Assignment) )
# 1033 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 264 "parsecmm.mly"
                                ( Caddi )
# 1039 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 265 "parsecmm.mly"
                                ( Csubi )
# 1045 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 266 "parsecmm.mly"
                                ( Cmuli )
# 1051 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 267 "parsecmm.mly"
                                ( Cdivi )
# 1057 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 268 "parsecmm.mly"
                                ( Cmodi )
# 1063 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 269 "parsecmm.mly"
                                ( Cand )
# 1069 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 270 "parsecmm.mly"
                                ( Cor )
# 1075 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 271 "parsecmm.mly"
                                ( Cxor )
# 1081 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 272 "parsecmm.mly"
                                ( Clsl )
# 1087 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 273 "parsecmm.mly"
                                ( Clsr )
# 1093 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 274 "parsecmm.mly"
                                ( Casr )
# 1099 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 275 "parsecmm.mly"
                                ( Ccmpi Ceq )
# 1105 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 276 "parsecmm.mly"
                                ( Ccmpi Cne )
# 1111 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 277 "parsecmm.mly"
                                ( Ccmpi Clt )
# 1117 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 278 "parsecmm.mly"
                                ( Ccmpi Cle )
# 1123 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 279 "parsecmm.mly"
                                ( Ccmpi Cgt )
# 1129 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 280 "parsecmm.mly"
                                ( Ccmpi Cge )
# 1135 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 281 "parsecmm.mly"
                                ( Cadda )
# 1141 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 282 "parsecmm.mly"
                                ( Caddv )
# 1147 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 283 "parsecmm.mly"
                                ( Ccmpa Ceq )
# 1153 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 284 "parsecmm.mly"
                                ( Ccmpa Cne )
# 1159 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 285 "parsecmm.mly"
                                ( Ccmpa Clt )
# 1165 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 286 "parsecmm.mly"
                                ( Ccmpa Cle )
# 1171 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 287 "parsecmm.mly"
                                ( Ccmpa Cgt )
# 1177 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 288 "parsecmm.mly"
                                ( Ccmpa Cge )
# 1183 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 289 "parsecmm.mly"
                                ( Caddf )
# 1189 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 290 "parsecmm.mly"
                                ( Cmulf )
# 1195 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 291 "parsecmm.mly"
                                ( Cdivf )
# 1201 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 292 "parsecmm.mly"
                                ( Ccmpf Ceq )
# 1207 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 293 "parsecmm.mly"
                                ( Ccmpf Cne )
# 1213 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 294 "parsecmm.mly"
                                ( Ccmpf Clt )
# 1219 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 295 "parsecmm.mly"
                                ( Ccmpf Cle )
# 1225 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 296 "parsecmm.mly"
                                ( Ccmpf Cgt )
# 1231 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 297 "parsecmm.mly"
                                ( Ccmpf Cge )
# 1237 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 298 "parsecmm.mly"
                                ( Ccheckbound Debuginfo.none )
# 1243 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    Obj.repr(
# 299 "parsecmm.mly"
                                ( Cmulhi )
# 1249 "parsecmm.ml"
               : 'binaryop))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'sequence) in
    Obj.repr(
# 302 "parsecmm.mly"
                                ( Csequence(_1, _2) )
# 1257 "parsecmm.ml"
               : 'sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 303 "parsecmm.mly"
                                ( _1 )
# 1264 "parsecmm.ml"
               : 'sequence))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'onecase) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'sequence) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'caselist) in
    Obj.repr(
# 306 "parsecmm.mly"
                                ( (_1, _2) :: _3 )
# 1273 "parsecmm.ml"
               : 'caselist))
; (fun __caml_parser_env ->
    Obj.repr(
# 307 "parsecmm.mly"
                                ( [] )
# 1279 "parsecmm.ml"
               : 'caselist))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'onecase) in
    Obj.repr(
# 310 "parsecmm.mly"
                                ( _2 :: _4 )
# 1287 "parsecmm.ml"
               : 'onecase))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 311 "parsecmm.mly"
                                ( [_2] )
# 1294 "parsecmm.ml"
               : 'onecase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 314 "parsecmm.mly"
                                ( bind_ident _1 )
# 1301 "parsecmm.ml"
               : 'bind_ident))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'datalist) in
    Obj.repr(
# 317 "parsecmm.mly"
                                ( List.rev _2 )
# 1308 "parsecmm.ml"
               : 'datadecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'datalist) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'dataitem) in
    Obj.repr(
# 320 "parsecmm.mly"
                                ( _2 :: _1 )
# 1316 "parsecmm.ml"
               : 'datalist))
; (fun __caml_parser_env ->
    Obj.repr(
# 321 "parsecmm.mly"
                                ( [] )
# 1322 "parsecmm.ml"
               : 'datalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 324 "parsecmm.mly"
                                ( Cdefine_symbol _1 )
# 1329 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 325 "parsecmm.mly"
                                ( Cdefine_label _1 )
# 1336 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 326 "parsecmm.mly"
                                ( Cint8 _2 )
# 1343 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 327 "parsecmm.mly"
                                ( Cint16 _2 )
# 1350 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 328 "parsecmm.mly"
                                ( Cint(Nativeint.of_int _2) )
# 1357 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 329 "parsecmm.mly"
                                ( Cdouble (float_of_string _2) )
# 1364 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 330 "parsecmm.mly"
                                ( Csymbol_address _2 )
# 1371 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 331 "parsecmm.mly"
                                ( Clabel_address _2 )
# 1378 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 332 "parsecmm.mly"
                               ( Csymbol_address _2 )
# 1385 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 333 "parsecmm.mly"
                               ( Clabel_address _2 )
# 1392 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 334 "parsecmm.mly"
                                ( Cstring _2 )
# 1399 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 335 "parsecmm.mly"
                                ( Cskip _2 )
# 1406 "parsecmm.ml"
               : 'dataitem))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 336 "parsecmm.mly"
                                ( Calign _2 )
# 1413 "parsecmm.ml"
               : 'dataitem))
(* Entry phrase *)
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
let phrase (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Cmm.phrase)
