TARGETS=simple1 fuzz1 fuzz2 fuzz3

all: ${TARGETS}

%: %.c
	clang -emit-llvm -S -fno-discard-value-names -c -o $@.ll $< -g
	opt -load ../build/InstrumentPass.so -Instrument -S $@.ll -o $@.instrumented.ll
	opt -load ../build/CBIInstrumentPass.so -CBIInstrument -S $@.instrumented.ll -o $@.cbi.instrumented.ll
	clang -o $@ ${PWD}/../lib/runtime.c $@.cbi.instrumented.ll

clean:
	rm -f *.ll *.cov *.cbi ${TARGETS}
