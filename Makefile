DIST=$(CURDIR)/dist
SRC=$(CURDIR)/src
IMAGES=$(CURDIR)/images
VENV=$(CURDIR)/.venv
BUILD=$(CURDIR)/.build

texSvgFiles := $(wildcard $(IMAGES)/*.svg.tex)
svgFiles := $(texSvgFiles:$(IMAGES)/%.svg.tex=$(SRC)/images/_generated/%.svg)
texPngFiles := $(wildcard $(IMAGES)/*.png.tex)
pngFiles := $(texPngFiles:$(IMAGES)/%.png.tex=$(SRC)/images/_generated/%.png)

.PHONY: all prod images dev dev-images clean

all: prod

$(VENV)/bin/activate:
	@echo "Setting up development virtual env in .venv"
	python -m venv .venv; \
	. .venv/bin/activate; \
	python -m pip install --upgrade pip; \
	python -m pip install wheel; \
	python -m pip install -r requirements.txt

$(SRC)/images/_generated/%.svg: $(IMAGES)/%.svg.tex
	mkdir -p $(BUILD)/images
	cd $(IMAGES) && pdflatex \
	    -shell-escape \
	    -halt-on-error \
	    -file-line-error \
	    -interaction nonstopmode \
	    -output-directory=$(BUILD)/images \
	    $*.svg.tex
	pdf2svg $(BUILD)/images/$*.svg.pdf $(SRC)/images/_generated/$*.svg

$(SRC)/images/_generated/%.png: $(IMAGES)/%.png.tex
	mkdir -p $(BUILD)/images/_generated
	cd $(IMAGES) && pdflatex \
	    -shell-escape \
	    -halt-on-error \
	    -file-line-error \
	    -interaction nonstopmode \
	    -output-directory=$(BUILD)/images \
	    $*.png.tex
	cd $(BUILD)/images && \
	    pdf2svg $*.png.pdf $*.svg && \
	    rsvg-convert $*.svg -o $(SRC)/images/_generated/$*.png

$(SRC)/_static/images/favicon.png: $(SRC)/images/_generated/favicon.svg
	mkdir -p $(SRC)/images/_generated
	rsvg-convert -h 180 $(SRC)/images/_generated/favicon.svg -o $(SRC)/_static/images/favicon.png

images: $(svgFiles) $(pngFiles) $(SRC)/_static/images/favicon.png

spelling: $(VENV)/bin/activate images
	. $(VENV)/bin/activate; \
	    sphinx-build -a -n -E -b spelling $(SRC) $(DIST)

$(DIST): $(VENV)/bin/activate images spelling
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
	    $(DIST)/_static/opensearch.xml \
	    $(DIST)/_static/basic.css \
	    $(DIST)/_static/file.png \
	    $(DIST)/_static/jquery-3.5.1.js \
	    $(DIST)/_static/language_data.js \
	    $(DIST)/_static/minus.png \
	    $(DIST)/_static/plus.png \
	    $(DIST)/_static/searchtools.js \
	    $(DIST)/_static/underscore-1.13.1.js \

prod: $(DIST)

dev: $(VENV)/bin/activate $(SRC)/_static/images/favicon.png $(svgFiles)
	. $(VENV)/bin/activate; \
	    sphinx-autobuild -a $(SRC) $(DIST) --host 0.0.0.0 --port=0 --open-browser

dev-images:
	while inotifywait -e close_write,create $(IMAGES) $(IMAGES)/*.tex;do \
	    rm -f $(svgFiles) $(pngFiles); \
	    $(MAKE) images; \
	done

clean:
	rm -rf $(DIST) $(VENV) $(BUILD)
	rm -f $(SRC)/images/_generated/*.png $(SRC)/images/_generated/*.svg
	rm -f $(SRC)/_static/images/favicon.png
