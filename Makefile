ELLPTIC = $(wildcard elliptic_curve/*.tex)
OPEN_IMG = $(wildcard open_image/*.tex)
REPRESENTATION = $(wildcard representation/*.tex)
SURJECTIVE = $(wildcard surjective/*.tex)
MISC = $(wildcard *.tex) main.bib
TEMPLATE = $(wildcard ucasthesis/Tex/*.tex) ucasthesis/Thesis.tex

DEPS = $(ELLPTIC) $(OPEN_IMG) $(REPRESENTATION) $(SURJECTIVE) $(MISC) $(TEMPLATE)

test_rule: $(DEPS)
	@echo "Test"
	@echo $(DEPS)

debug: $(DEPS)
	@latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build/debug main.tex

release: $(DEPS)
	@cd ucasthesis && \
	latexmk -xelatex -interaction=nonstopmode -outdir=../build/release Thesis.tex