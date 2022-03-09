package FeedHandler;

import ClientServer :: *;
import GetPut       :: *;
import FIFOF        :: *;

typedef Server #(Bit#(32),Bit#(32)) Parser_IFC;

(* synthesize *)
module mkParser(Parser_IFC);
	
	FIFOF #(Bit #(32)) fifo_in_x <- mkFIFOF;
	FIFOF #(Bit #(32)) fifo_out_y <- mkFIFOF;
	Reg #(Bit #(2)) timer <- mkReg(0);
	Reg #(Bit #(32)) val <- mkReg(0);

	rule timer_increment;
		timer <= timer+1;
		$display("Timer  : %0d",timer);
	endrule: timer_increment

	rule packet_in(timer==0);
		val <= fifo_in_x.first;
		$display("Packet Received : %d",val);
		fifo_in_x.deq;
	endrule: packet_in

	rule packet_out(timer==3);
		let x = val*2;
		fifo_out_y.enq(x);
	endrule: packet_out

	return toGPServer(fifo_in_x,fifo_out_y);

endmodule: mkParser

endpackage: FeedHandler
