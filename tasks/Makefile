SOURCES = generator.v
SIM_RES = generator_tb.fst

all: $(SIM_RES)

test: $(SIM_RES)

%_tb: %_tb.v generator.v
	iverilog -o $@ $^

%_tb.fst: %_tb
	vvp -N $< -fst +waveform=$@

int: generator_tb
	vvp generator_tb

clean:
	rm -f *_tb *.fst

.SECONDARY:
.PHONY: all clean test int
