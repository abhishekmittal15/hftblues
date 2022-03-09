package TestBench ;

import FeedHandler  :: *;
import C_imports    :: *;
import ClientServer :: *;
import GetPut       :: *;

module mkTestBench(Empty);

// 	Reg #(Bits#(32)) packet <- mkReg(0);
	Parser_IFC parser <- mkParser;
	Reg #(Bit#(32)) in_packets <- mkReg(0);
	Reg #(Bit#(32)) out_packets <- mkReg(0);

	rule stream(in_packets<5);
		
		// accept a packet from the c file 
		let packet <- get_packet();
		in_packets <= in_packets + 1;
		// push the packet into a fifo
		parser.request.put(packet);

	endrule: stream

	rule drain((in_packets>0));
		let outpt <- parser.response.get();
		out_packets <= out_packets+1;
		$display("Packet Sent Back : %0d",outpt);
		if(out_packets==5)
			$finish;
	endrule: drain

endmodule: mkTestBench

endpackage: TestBench
