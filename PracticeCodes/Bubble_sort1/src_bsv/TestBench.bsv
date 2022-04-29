// // Define the package name 
// package TestBench;
// // Mention any typedefs or structs or derive a few inbuilt functions

// // Define the Importing files and modules 
// import Sort :: *;
// import c_imports :: *;

// // Define the Interface if any for this package 

// // Define any functions that you might want to 
// // function Bool notFn (Bool x);
// //     if (x) notFn = False;
// //     else notFn = True;
// // endfunction: notFn
    

// // Define the modules 
// // ----------------------------
// // Any attributes for the module to follow 
// (* synthesize *)
// // Define the 1st module and inherit the appropriate interface 
// module mkTestBench(Empty);

//     // Initialise the state of the Module


//     // Define the rules for the module 
//     rule start ( True );

//         // String read_file="file.dat";
//         // File lfh <- $fopen(read_file,"r");

//         // int i <- $fgetc( lfh );
//         // if ( i != -1 )
//         //     begin
//         //         $display("i is : %0d",i);
//         //         i = i-48;
//         //         $display("i is : %0d",i);
//         //         Bit#(1) c = truncate( pack(i) ) ;
//         //         $display("Value is %0d",c);
//         //     end
//         // else // an error occurred.
//         //     begin
//         //         $display( "Could not get byte from %s",read_file ) ;
//         //     end
//         // $fclose ( lfh ) ;
//         // Bool x = True;
//         // $display("Value of x is : %b",x);
//         // Bool i <- notfn(x);
//         // $display("Value of x is : %b",i);
//         int i <- check();
//         $display("the number received is %0d",i);
//         $finish(0);

//     endrule


//     // Define the methods in the interface inherited

// endmodule
// endpackage

// Copyright (c) 2013-2016 Bluespec, Inc.  All Rights Reserved.

package TestBench;

// ================================================================
// Testbench to drive the sorting module.
// Feed n unsorted inputs to sorter,
// drain n sorted outputs and print
// ================================================================
// BSV lib imports

import LFSR :: *;

// ================================================================
// Project imports

import Utils      :: *;
import Bubblesort :: *;
import c_imports :: *;

// ================================================================
// Size of array to be sorted

Int#(32) n = 5;

// ================================================================
// Testbench module

(* synthesize *)
module mkTestBench (Empty);
    Reg #(Int#(32)) rg_j1 <- mkReg (0);
    Reg #(Int#(32)) rg_j2 <- mkReg (0);
    Reg #(Int#(32)) opened_file <- mkReg(0);
    Reg #(Int#(32)) closed_file <- mkReg(0);

    // Instantiate an 8-bit random number generator from BSV lib
    //    LFSR #(Bit #(8)) lfsr <- mkLFSR_8;

    // Instantiate the parallel sorter
    Sort_IFC sorter <- mkBubblesort;

    rule rl_open_file(opened_file==0);

        let x <- open_file();
        opened_file <= x ;
        $display("Entered the open_file rule: %0d",x);

    endrule

    rule rl_feed_inputs ((rg_j1 < n) && (opened_file==59));
        //   Bit#(32) v = zeroExtend (lfsr.value ());
        //   lfsr.next ();
        //   Int#(32) x = unpack (v);
        let x <- read_ints();
        sorter.put (x);
        rg_j1 <= rg_j1 + 1;
        $display ("%0d: x_%0d = %0d", cur_cycle, rg_j1, x);
    endrule

   rule rl_drain_outputs (rg_j2 < n);
      let y <- sorter.get ();
      rg_j2 <= rg_j2 + 1;
      $display ("                                %0d: y_%0d = %0d", cur_cycle, rg_j2, y);
   endrule

   rule rl_close_file (rg_j2==n);

        let x <- close_file();
        closed_file <= x;
        $display("Closed file : %0d",x);
        $finish;

    endrule

endmodule

// ================================================================

endpackage: TestBench
