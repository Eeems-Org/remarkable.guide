DIST=dist
SRC=src
VENV=.venv
BUILD=.build

texFiles := $(wildcard src/images/*.svg.tex)
imageFiles := $(texFiles:src/images/%.svg.tex=src/_static/images/%.svg)

all: prod

$(VENV)/bin/activate:
	@echo "Setting up development virtual env in .venv"
	python -m venv .venv; \
	. .venv/bin/activate; \
	python -m pip install -r requirements.txt

src/_static/images/%.svg: src/images/%.svg.tex
	mkdir -p $(BUILD)/images
	cd src/images && pdflatex \
	    -shell-escape \
	    -halt-on-error \
	    -file-line-error \
	    -interaction nonstopmode \
	    -output-directory=../../.build/images \
	    $*.svg.tex
	pdf2svg $(BUILD)/images/$*.svg.pdf src/_static/images/$*.svg

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

dev-images:
	while inotifywait -e close_write src/images/*.tex;do \
	    rm -f $(imageFiles); \
	    $(MAKE) $(imageFiles); \
	done

clean:
	rm -rf $(DIST) $(VENV) $(BUILD)
	rm -f src/_static/images/*.png src/_static/images/*.svg

.PHONY: all prod dev clean
