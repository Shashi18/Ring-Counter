module D(d,reset,clk,q);
input d;
input clk;
input reset;
output q;
reg q;
initial q = 1'b1;
always @(posedge clk)
begin
if(reset==0)
q <= d;
else
q <= 1'b0;
end
endmodule

module D2(d,clk,q);
input d;
input clk;
output q;
reg q;
initial
q = 1'b0;
always @(posedge clk)
q <= d;
endmodule

module Ring_B();
reg clk;
reg reset;
wire [3:0]q;
initial
begin
reset = 1;
clk = 0;
#45 reset = 0;
end

D ini(q[3],reset,clk,q[0]);  // for first FF
D2 rest1(q[0],clk,q[1]);      //***
D2 rest2(q[1],clk,q[2]);          // * These are rest FFs
D2 rest3(q[2],clk,q[3]);      //***
always
#5 clk = !clk ;
endmodule
