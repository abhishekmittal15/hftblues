

module mkTestBench (Empty);

    // rule rl_print_answer();
    rule rl_print_answer; 
        $display("Deep Thought says: Hello, World! The answer is 42");
        // $finish;
    endrule

    rule rl_print_duplicate;
        $display("Bye Bye");
        $finish;
    endrule

endmodule