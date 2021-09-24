# # Minimal makefile for Sphinx documentation
# #
#
# # You can set these variables from the command line, and also
# # from the environment for the first two.
# SPHINXOPTS    ?=
# SPHINXBUILD   ?= sphinx-build
# SOURCEDIR     = source
# BUILDDIR      = build
#
# # Put it first so that "make" without argument is like "make help".
# help:
# 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
#
# .PHONY: help Makefile
#
# # Catch-all target: route all unknown targets to Sphinx using the new
# # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# %: Makefile
# 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: all
all: sphinx

BUILD_DIR=_build
SPHINXOPTS=-n -W -d $(BUILD_DIR)/doctrees .

.PHONY: html
html:
	sphinx-build -b html $(SPHINXOPTS) $(BUILD_DIR)/html

.PHONY: coverage
coverage:
	sphinx-build -b coverage ${SPHINXOPTS} $(BUILD_DIR)/coverage
	cat build/coverage/python.txt

.PHONY: latex
latex:
	sphinx-build -b latex $(SPHINXOPTS) $(BUILD_DIR)/latex

# Building a pdf requires a latex installation.  For macports, the needed
# packages are texlive-latex-extra and texlive-fonts-recommended.
# The output is in build/latex/tornado.pdf
.PHONY: pdf
pdf: latex
	cd $(BUILD_DIR)/latex && pdflatex -interaction=nonstopmode tornado.tex

clean:
	rm -rf $(BUILD_DIR)

.PHONY: livehtml
livehtml:
	sphinx-autobuild -b html $(SPHINXOPTS) $(BUILD_DIR)/html

.PHONY: serve
serve:
	sphinx-autobuild -b html $(SPHINXOPTS) $(BUILD_DIR)/html
