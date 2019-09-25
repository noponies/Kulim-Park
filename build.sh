# Clean up
rm ./fonts/ttf/*.ttf

# # Build static instances
fontmake -g ./sources/kulim-park-master.glyphs -o ttf -i --output-dir ./fonts/ttf -a
fontmake -g ./sources/kulim-park-master-italic.glyphs -o ttf -i --output-dir ./fonts/ttf -a
for f in ./fonts/ttf/*.ttf
do
	echo 'Processing $f'
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

# Clean up
rm -r instance_ufo
rm -r master_ufo
