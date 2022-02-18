// Define the package name 
package TestBench;

// Import the necessary modules
import DeepThought ::* ;

// Define the Interface if any 

// Define the modules 
module mkTestBench(Empty);

    // Instantiating the module from DeepThought
    DeepThought_IFC deep_mod <- mkDeepThought;

    rule rl_start;
        
        $display("Starting the deep mod module");
        deep_mod.start;

    endrule

    rule rl_print_answer;

        let x <- deep_mod.getAnswer;
        $display("Hello World. The answer is %0d",x);
        $finish;

    endrule

endmodule


endpackage