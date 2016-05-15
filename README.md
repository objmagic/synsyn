## SynSyn

bisecting OCaml code under `/parsing` to help:  
1. find bug in `-dsource` (parsing/pprintast.ml)  
2. create a synthetic source file that exercise all current syntactic features  
3. migrating to Menhir based parser  

### How-to

````Bash
$ opam switch 4.03.0  
$ eval `opam config env`
$ make BISECT_COVERAGE=YES  
$ make report
````
