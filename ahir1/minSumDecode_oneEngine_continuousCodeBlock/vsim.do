set AHIR_RELEASE $::env(AHIR_RELEASE)
set AJIT_PROJECT_HOME $::env(AJIT_PROJECT_HOME)
setenv LD_LIBRARY_PATH $AJIT_PROJECT_HOME/processor/Aa/modelsim/lib 

vlib ModelsimLink
vmap ModelsimLink ModelsimLink
vcom -work ModelsimLink /home/anurag/AHIR/ahir/release/vhdl/ModelsimLink.vhdl 

vlib aHiR_ieee_proposed
vmap aHiR_ieee_proposed aHiR_ieee_proposed
vcom -work aHiR_ieee_proposed /home/anurag/AHIR/ahir/release/vhdl/aHiR_ieee_proposed.vhdl 

vlib ahir
vmap ahir ahir
vcom -work ahir /home/anurag/AHIR/ahir/release/vhdl/ahir.vhdl 

vlib work
vmap work work
vcom -work work /home/anurag/LDPC/projectLDPC/ahir/minSumDecode_withoutPointers_one_daemon/ahir_system.vhdl

vlib work
vmap work work
vcom -work work /home/anurag/LDPC/projectLDPC/ahir/minSumDecode_withoutPointers_one_daemon/ahir_system_test_bench.vhdl

vsim -novopt -t ps -foreign "initForeign libFli.so" work.ahir_system_test_bench

#Ignore integer warnings at time 0 

set StdArithNoWarnings 1 

run 100ns 

set StdArithNoWarnings 0 

# comment following line to run for 100 ns 

run -all 

