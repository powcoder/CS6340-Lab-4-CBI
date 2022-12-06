https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
#!/bin/bash

#mkdir build
[ ! -d "build" ] && mkdir build
cd build
cmake ..
make clean
make

cd ../test/
#mkdir fuzz_output
[ ! -d "fuzz_output" ] && mkdir fuzz_output
make
timeout 10 ../build/fuzzer ./fuzz1 fuzz_input fuzz_output 10
../build/cbi ./fuzz1 fuzz_output

#Full run
clang -emit-llvm -S -fno-discard-value-names -c fuzz1.c -g
opt -load ../build/InstrumentPass.so -Instrument -S fuzz1.ll -o fuzz1.instrumented.ll
opt -load ../build/CBIInstrumentPass.so -CBIInstrument -S fuzz1.instrumented.ll -o fuzz1.cbi.instrumented.ll
clang -o fuzz1 ../lib/runtime.c fuzz1.cbi.instrumented.ll

exit 