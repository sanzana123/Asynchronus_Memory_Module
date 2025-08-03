module async_mem (
    input wire [7:0] addr,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    input wire cs,
    input wire rd,
    input wire wr
);

    reg [7:0] mem [0:255];

    always @(*) begin
        if (!cs && !rd && wr)
            data_out = mem[addr];
        else
            data_out = 8'hzz; // Fixed: high impedance when not reading
    end

    always @(negedge wr) begin
        if (!cs && rd && !wr)
            mem[addr] <= data_in;
    end

endmodule

module testBench_asynchronus_mem;

    //All inputs should be reg 
    //All outputs should be wires 
   
    reg [7:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;
    reg cs;
    reg rd;
    reg wr;
   
   async_mem uut (
   
   .addr(addr),
   .data_in(data_in),
   .data_out(data_out),
   .cs(cs),
   .rd(rd),
   .wr(wr)
   
   );
   
    initial begin 
     cs = 1'b1;
     rd = 1'b1;
     wr = 1'b1;
     data_in = 8'h00;
     addr = 8'h00;
     
    //Writing to memory
    
     addr = 8'b00010000;   //010
     data_in = 8'b10101011; //0xAB
     cs = 1'b0;
     wr = 1'b0;
     rd = 1'b1;
     
     
     
     #5
     cs = 1'b1;
     wr = 1'b1;
     rd = 1'b1;
     addr = 8'b00010000;   //010
     data_in = 8'b10101011; //0xAB
     
    //Reading from memory
     cs = 1'b0;
     rd = 1'b0;
     
     #5
     $display("READ DATA  at 0x%h %h", addr, data_out);

     cs = 1'b1;
     rd = 1'b1;
     
     
    
    end 
    
endmodule 
    
     
    
    
    
    
    
   
   
