package testbench;

module mktestbench;

    // instantiate a module 

    rule print_rule;
        let x <- deepthought.getAnswer;
        display("The answer is %d",x);
    endrule

endmodule
