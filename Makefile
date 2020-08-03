
www/blicon.html: src/blicon.html.in www/blender_icons32.png build
	export AREAS="$$(blender --background --factory-startup -noaudio --python src/datatoc_icon_split.py -- --image=www/blender_icons32.png --output=build/blender_icons32 --output_prefix=icon32_ --name_style=UI_ICONS --parts_x 26 --parts_y 30 --minx 6 --maxx 106 --miny 6 --maxy 16 --minx_icon 4 --maxx_icon 4 --miny_icon 4 --maxy_icon 4 --spacex_icon 2 --spacey_icon 2 | grep area)" ;\
	cat src/blicon.html.in | envsubst > "$@"

build:
	mkdir -p "$@"

www:
	mkdir -p "$@"

www/blender_icons32.png: src/blender_icons.svg www
	inkscape "$<" --export-width=1204 --export-height=1280 --without-gui --export-png="$@"

clean:
	rm -rf build www
