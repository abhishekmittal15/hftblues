// Define the package name 
package DeepThought;

// Define the interface that the package has 
interface DeepThought_IFC;

    // Declare the functions that the package will provide the external world
    method ActionValue#(int) getAnswer;

endinterface

// Import other modules if needed 

// Create Modules 
// -----------------------------------
// Synthesize Directive 
(* synthesize *)
// In the module you define the module name and pass the interface to the module 
module mkDeepThought (DeepThought_IFC);

    // You have to mention the return value and the inputs and the function name 
    method ActionValue#(int) getAnswer;
        return 42;
    endmethod

endmodule
// -----------------------------------

endpackage