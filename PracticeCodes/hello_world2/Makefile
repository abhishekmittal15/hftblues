
compile: 
	bsc -sim -g mkTestBench TestBench.bsv

link: 
	bsc -sim -e mkTestBench -o ./mkTestBench_bsim

simulate:
	./mkTestBench_bsim

verilog:
	bsc -verilog -g mkTestBench TestBench.bsv

v_link:
	bsc -verilog -e mkTestBench -o mkTestBench_vsim -vsim iverilog mkTestBench.v

v_simulate:
	./mkTestBench_vsim

clean_bsim:
	rm *.o *.ba *.bo *.cxx *.so *.h 

cleanall_bsim: clean_bsim
	rm *_bsim

clean_vsim:
	rm *.v

cleanall_vsim: clean_vsim 
	rm *_vsim