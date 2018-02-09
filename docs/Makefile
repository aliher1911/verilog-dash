all: verilog.docset/Contents/Info.plist

verilog.docset/Contents/Info.plist: dashing.json styles.css *.html
	~/go/bin/dashing build

clean:
	rm -fr verilog.docset

.PHONY: all clean
