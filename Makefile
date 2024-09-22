inkscape ?= inkscape

all: \
_build/atopile-workflow-black.png \
_build/atopile-workflow-transparent.png \
_build/atopile-workflow.svg \
_build/kicad-workflow-black.png \
_build/kicad-workflow-transparent.png \
_build/kicad-workflow.svg


_build/kicad-workflow-transparent.png: _build/kicad-workflow.svg
	$(inkscape) --actions="export-filename:$@;export-do;FileClose" $<

_build/atopile-workflow-transparent.png: _build/atopile-workflow.svg
	$(inkscape) --actions="export-filename:$@;export-do;FileClose" $<

_build/kicad-workflow-black.png: _build/kicad-workflow.svg
	$(inkscape) --export-background=black --export-filename=$@ $<

_build/atopile-workflow-black.png: _build/kicad-workflow.svg
	$(inkscape) --export-background=black --export-filename=$@ $<

_build/atopile-workflow.svg: atopile-kicad-workflow.svg
	cp $< $@.tmp
	$(inkscape) --actions="export-text-to-path;select-by-id:layer-kicad;delete;export-plain-svg;export-filename:$@;export-do;FileClose" $@.tmp
	$(RM) $@.tmp

_build/kicad-workflow.svg: atopile-kicad-workflow.svg
	cp $< $@.tmp
	$(inkscape) --actions="export-text-to-path;select-by-id:layer-atopile;delete;export-plain-svg;export-filename:$@;export-do;FileClose" $@.tmp
	$(RM) $@.tmp
