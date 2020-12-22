`timescale 1ns / 1ps
//This warning is okay to ignore: WARNING:Xst:1336 -  (*) More than 100% of Device resources are used

//keep port description below, intact.
module Extra1LP(
     input clk,
    input [31:0] A_in,
    input [31:0] B_in,
    input [31:0] C_in,
    output [35:0] Q
    );
     
/* VERSION 1-Tsotne
=========================================================================
Advanced HDL Synthesis Report

Macro Statistics
# Adders/Subtractors                                   : 2
 32-bit adder carry out                                : 1
 36-bit adder                                          : 1
# Registers                                            : 132
 Flip-Flops                                            : 132
 
 

Timing Summary:
---------------
Speed Grade: -4

   Minimum period: 7.803ns (Maximum Frequency: 128.156MHz) <<< that is 128 milion operations per second
   Minimum input arrival time before clock: 2.059ns
   Maximum output required time after clock: 4.283ns
   Maximum combinational path delay: No path found
*/   
     reg [35:0] result;
     reg [31:0] A, B, C, Cdelay1, Cdelay2;
	  reg [31:0] res1;
	  reg [31:0] res2;
	  //reg [1:0] count=1;
//	  reg [31:0] res1Pos;
//	  reg [31:0] res2Pos;
//	  wire res1end;
//	  wire res2end;
//	  always @(posedge clk) begin 	
//			res1Pos<=res1;
//			res2Pos<=res2;
//
//	  end
//	  assign res1end = !res1Pos & res1;
	  //assign res2end = !res2Pos & res2;
     always @(posedge clk)
     begin
         //keep following 3 lines intact, and do the operations on A,B,C
         A<= A_in; 
         B<= B_in;
         C<= C_in;
			

         
         // while implementing the execution of ecuation, don't open brackets, 
            //meaning, don't do ... A*4 + B*4 
            
         // while keeping the brackets, you can still do:
            //A+B->res1, 
            //res1*4->res2, 
            //res2+C, 
        
        //after doing so, prepare synthesis and simulation data for reports
            //and then do anything to improve, includin opening brackets
        
         //result <= ((A+B)<<2)+C; 
			
			res1 <= A+B<<2;
			Cdelay1<=C;
			
				//res2<=res1<<2;
						
			result<=res1+Cdelay1;
			
//			case(count)
//			1: begin
//			#10;
//			res1 <= A+B;
//			count<=2;
//			
//			end
//			2: begin
//			#10;
//			res2 <= res1<<2;
//			count<=3;
//			end
//			3: begin
//			#10;
//			result <=  res2+C;
//			count<=1;
//			end
//			endcase
			
			
		
     end
     
     //keep that intact also
     assign Q = result; 
     
endmodule