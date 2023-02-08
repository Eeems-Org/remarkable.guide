DIST=dist
SRC=src
VENV=.venv

texFiles := $(wildcard src/images/*.svg.tex)
imageFiles := $(texFiles:src/images/%.svg.tex=src/_static/images/%.svg)

all: prod

$(VENV)/bin/activate:
	@echo "Setting up development virtual env in .venv"
	python -m venv .venv; \
	. .venv/bin/activate; \
	python -m pip install -r requirements.txt

.build/images:
	mkdir -p .build/images

.build/images/%.pdf: .build/images src/images/%.svg.tex
	cd src/images && pdflatex \
	    -shell-escape \
	    -halt-on-error \
	    -file-line-error \
	    -interaction nonstopmode \
	    -output-directory=../../.build/images \
	    $*.svg.tex

src/_static/images/%.svg: .build/images/%.pdf
	pdf2svg .build/images/$*.svg.pdf src/_static/images/$*.svg

src/_static/images/favicon.png: src/_static/images/favicon.svg
	rsvg-convert -h 180 src/_static/images/favicon.svg -o src/_static/images/favicon.png

prod: $(VENV)/bin/activate $(imageFiles) src/_static/images/favicon.png
	. $(VENV)/bin/activate; \
	sphinx-build -a -n -E -b html $(SRC) $(DIST)
	# Clean unused files inherited from default theme
	rm -rf $(DIST)/.doctrees \
	    $(DIST)/.buildinfo \
	    $(DIST)/genindex.html \
	    $(DIST)/objects.inv \
	    $(DIST)/search.html \
	    $(DIST)/searchindex.js \
	    $(DIST)/_sources \
	    $(DIST)/_static/basic.css \
	    $(DIST)/_static/doctools.js \
	    $(DIST)/_static/documentation_options.js \
	    $(DIST)/_static/file.png \
	    $(DIST)/_static/jquery-3.5.1.js \
	    $(DIST)/_static/jquery.js \
	    $(DIST)/_static/language_data.js \
	    $(DIST)/_static/minus.png \
	    $(DIST)/_static/plus.png \
	    $(DIST)/_static/pygments.css \
	    $(DIST)/_static/searchtools.js \
	    $(DIST)/_static/underscore-1.13.1.js \
	    $(DIST)/_static/underscore.js \

dev: $(VENV)/bin/activate src/_static/images/favicon.png $(imageFiles)
	. $(VENV)/bin/activate; \
	    sphinx-autobuild -a $(SRC) $(DIST)


clean:
	rm -rf $(DIST)
	rm -rf $(VENV)
	rm -rf .build/
	rm -f src/_static/images/*.png
	rm -f src/_static/images/*.svg

.PHONY: all prod dev clean
