# copied from https://github.com/josefprusa/Prusa3/blob/master/Makefile
# changed by t00tie

INCLUDES = $(wildcard inc/*.scad)

MODELS = $(filter-out configuration.scad, $(wildcard *.scad))

STL_FILES_1 = $(foreach src, $(MODELS),output/$(src))
STL_FILES = $(STL_FILES_1:%.scad=%.stl)

all: $(STL_FILES)

output/%.stl: %.scad $(INCLUDES) configuration.scad
	mkdir -p output
	openscad -o $@ $<

clean:
	rm $(STL_FILES)
