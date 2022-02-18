// Package name 
package TestBench;

// Import Other packages 
import DeepThought :: *;

// Create a module 
// ------------------------------
// Synthesize directive 
(* synthesize *)
module mkTestBench (Empty);

    // Instantiating modules from the packages imported
    DeepThought_IFC deepThought <- mkDeepThought;

    // Write all the rules
    rule rl_print_answer;
        // Invoking an Action Module 
        let x <- deepThought.getAnswer;
        // Display the statement 
        $display ("Deep Thought says: Hello, World! The answer is %0d.%0d",x,x);
        // Finish the entire execution of the module 
        $finish;
    endrule

endmodule
// ------------------------------

endpackage