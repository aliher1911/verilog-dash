all: verilog.docset/Contents/Info.plist

GOPATH ?= ${HOME}/go/bin

verilog.docset/Contents/Info.plist: dashing.json styles.css *.html
	${GOPATH}/dashing build

clean:
	rm -fr verilog.docset

.PHONY: all clean
