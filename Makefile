all: build

OCAMLBUILD_FLAGS = -use-ocamlfind -classic-display \
									 -package bisect_ppx \
									 -plugin-tag 'package(bisect_ppx.ocamlbuild)'

OCAMLBUILD = ocamlbuild $(OCAMLBUILD_FLAGS)

build: src/checkparse.ml
	$(OCAMLBUILD) src/checkparse.byte

report: build clean-report
	./checkparse.byte st.ml
	bisect-ppx-report -I _build/ -I src/ -html coverage/ bisect*.out

clean-report:
	rm -rf coverage *.out

clean:
	$(OCAMLBUILD) -clean
	rm -rf *.out coverage

.PHONY: build clean report
