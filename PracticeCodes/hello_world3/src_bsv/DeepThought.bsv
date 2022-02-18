// Define the package name 
package DeepThought;

typedef enum {IDLE,THINKING,ANSWER_READY} State_DT
deriving (Eq,Bits,FShow);
// Importing Packages 

// Define the Interface of the package 
interface DeepThought_IFC;
    
    method Action start;
    method ActionValue #(int) getAnswer;

endinterface

// Define the modules and specify the interface it used 
(* synthesize *)
module mkDeepThought (DeepThought_IFC);

// Define the initial state of the module 

    Reg #(State_DT) rg_state <- mkReg(IDLE);
    Reg #(Bit #(4)) time_passed <- mkReg(0) ;

    let minutes = time_passed[3:1];
    let half_minute = time_passed[0];

    rule update_state(rg_state==THINKING);
        $display("%0d.%0d minutes has passed",time_passed[3:1],time_passed[0]);
        if(time_passed[3:1]==7) 
            rg_state <= ANSWER_READY;
        else
            time_passed <= time_passed + 1;
    endrule

    method Action start if(rg_state==IDLE);
        
        rg_state <= THINKING;
    
    endmethod

    method ActionValue#(int)  getAnswer if(rg_state==ANSWER_READY);
    
        rg_state <= IDLE;
        time_passed <= 0;
        return 42;

    endmethod

endmodule

endpackage