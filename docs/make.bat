@REM @ECHO OFF
@REM
@REM pushd %~dp0
@REM
@REM REM Command file for Sphinx documentation
@REM
@REM if "%SPHINXBUILD%" == "" (
@REM 	set SPHINXBUILD=sphinx-build
@REM )
@REM set SOURCEDIR=source
@REM set BUILDDIR=build
@REM
@REM if "%1" == "" goto help
@REM
@REM %SPHINXBUILD% >NUL 2>NUL
@REM if errorlevel 9009 (
@REM 	echo.
@REM 	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
@REM 	echo.installed, then set the SPHINXBUILD environment variable to point
@REM 	echo.to the full path of the 'sphinx-build' executable. Alternatively you
@REM 	echo.may add the Sphinx directory to PATH.
@REM 	echo.
@REM 	echo.If you don't have Sphinx installed, grab it from
@REM 	echo.http://sphinx-doc.org/
@REM 	exit /b 1
@REM )
@REM
@REM %SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
@REM goto end
@REM
@REM :help
@REM %SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
@REM
@REM :end
@REM popd

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
