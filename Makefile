all: \
_build/kicad-workflow.png \
_build/atopile-workflow.png


_build/layer-base.png: atopile-kicad-workflow.svg
	inkscape --export-area-page --export-id-only --export-png=$@ --export-id="layer-base" $<

_build/layer-kicad.png: atopile-kicad-workflow.svg
	inkscape --export-area-page --export-id-only --export-png=$@ --export-id="layer-kicad" $<

_build/layer-atopile.png: atopile-kicad-workflow.svg
	inkscape --export-area-page --export-id-only --export-png=$@ --export-id="layer-atopile" $<

_build/kicad-workflow.png: _build/layer-base.png _build/layer-kicad.png
	convert $^ -gravity center -background None -layers Flatten $@

_build/atopile-workflow.png: _build/layer-base.png _build/layer-atopile.png
	convert $^ -gravity center -background None -layers Flatten $@
