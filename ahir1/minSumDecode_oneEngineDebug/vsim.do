setenv LD_LIBRARY_PATH /home/aswin/AjitRepoV2/processor/Aa/modelsim/lib 

vlib ModelsimLink
vmap ModelsimLink ModelsimLink
vcom -work ModelsimLink /home/anurag/AHIR/ahir/release/vhdl/ModelsimLink.vhdl 

vlib aHiR_ieee_proposed
vmap aHiR_ieee_proposed aHiR_ieee_proposed
vcom -work aHiR_ieee_proposed /home/anurag/AHIR/ahir/release/vhdl/aHiR_ieee_proposed.vhdl 

vlib ahir
vmap ahir ahir
vcom -work ahir /home/anurag/AHIR/ahir/release/vhdl/ahir.vhdl 

# anurag_modified_begin
vlib work
vmap work work
vcom -work work /home/anurag/LDPC/projectLDPC/ahir/minSumDecode_oneEngineDebug/ahir_system_global_package.vhdl
# anurag_modified_end

vlib work
vmap work work
vcom -work work /home/anurag/LDPC/projectLDPC/ahir/minSumDecode_oneEngineDebug/ahir_system.vhdl

vlib work
vmap work work
vcom -work work /home/anurag/LDPC/projectLDPC/ahir/minSumDecode_oneEngineDebug/ahir_system_test_bench.vhdl

vsim -novopt -t ps -foreign "initForeign libFli.so" work.ahir_system_test_bench

add wave -r sim:/ahir_system_test_bench/ahir_system_instance/*
#Ignore integer warnings at time 0 

set StdArithNoWarnings 1 

run 0ns 

set StdArithNoWarnings 0 

# comment following line to run for 100 ns 

run -all 

