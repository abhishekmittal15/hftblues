top_module=
top_file=
c_file=

src_directory=src_bsv
path_files=./$(src_directory):%/Libraries 

sim_dir=build_bsim
info_dir=build_bsim
build_dir=build_bsim
v_build_dir=build_vsim
v_info_dir=build_vsim
v_sim_dir=build_vsim

bsv_compile_flags=-u -sim -simdir $(sim_dir) -bdir $(build_dir) -info-dir $(info_dir) -keep-fires -aggressive-conditions -p $(path_files)
bsv_link_flags=-sim -simdir $(sim_dir) -bdir $(build_dir) -info-dir $(info_dir) -p $(path_files)

verilog_compile_flags=-u -verilog -vdir $(v_sim_dir) -bdir $(v_build_dir) -info-dir $(v_info_dir) -elab -keep-fires -aggressive-conditions -no-warn-action-shadowing -p $(path_files)
verilog_link_flags=-verilog -vsim iverilog -vdir $(v_sim_dir) -bdir $(v_build_dir) -info-dir $(v_info_dir) -p $(path_files) 


compile:
	@echo "Creating Simulation Directory" ;
	mkdir $(sim_dir)
	@if [ -d $(info_dir) ]; then\
		echo "Info Directory is same";\
	else\
		mkdir $(info_dir);\
	fi
	@if [ -d $(build_dir) ]; then \
		echo "Build Directory is same";\
	else\
		mkdir $(build_dir);\
	fi
	bsc $(bsv_compile_flags) -g $(top_module) $(src_directory)/$(top_file).bsv
	@echo "-------------"
	@echo "Compiled"
	@echo "-------------"

link: 
	bsc $(bsv_link_flags)  -e $(top_module) -o ./$(src_directory)/$(top_module)_bsim ./$(src_directory)/$(c_file).c
	@echo "-------------"
	@echo "Linked"
	@echo "-------------"

simulate:
	@echo "-------------"
	@echo "Results"
	@echo "-------------"
	./$(src_directory)/$(top_module)_bsim

ball: compile link simulate

v_compile:
	@echo "Creating Simulation Directory" ;
	mkdir $(v_sim_dir)
	@if [ -d $(v_info_dir) ]; then\
		echo "Info Directory is same";\
	else\
		mkdir $(v_info_dir);\
	fi
	@if [ -d $(v_build_dir) ]; then \
		echo "Build Directory is same";\
	else\
		mkdir $(v_build_dir);\
	fi
	bsc -g $(top_module) $(verilog_compile_flags) $(src_directory)/$(top_file).bsv
	@echo "--------------";
	@echo "Compiled";
	@echo "--------------";

v_link:
	bsc $(verilog_link_flags) -e $(top_module) -o ./$(v_build_dir)/$(top_module)_vsim $./$(build_dir)/$ (top_module).v
	@echo "--------------";
	@echo "Linked";
	@echo "--------------";
	
v_simulate:
	@echo "--------------";
	@echo "Results";
	@echo "--------------";
	@./$(v_build_dir)/$(top_module)_vsim
	
vall: v_compile v_link v_simulate

clean_ball:
	rm -rf build_bsim

clean_vall:
	rm -rf build_vsim

clean_bsim:
	rm *.o *.ba *.bo *.cxx *.so *.h 

cleanall_bsim: clean_bsim
	rm *_bsim

clean_vsim:
	rm *.v

cleanall_vsim: clean_vsim 
	rm *_vsim