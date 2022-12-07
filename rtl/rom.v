`timescale 1ns / 1ps

//-------------------------------------------------------------------------------------------------
module rom
//-------------------------------------------------------------------------------------------------
#
(
	parameter AW = 14,
	parameter DW = 8,
	parameter FN = "rom8x16K.hex"
) (
	input  wire         clock,
	input  wire         enable,
	output reg [DW-1:0] q,
	input  wire[AW-1:0] address
);
//-------------------------------------------------------------------------------------------------

    initial begin
        $display("rom Loading rom. %s",FN);
        $display(FN);
        if (FN>0)
                $readmemh(FN, d);
    end

reg[DW-1:0] d[(2**AW)-1:0];

always @(posedge clock) if(enable) q<= d[address];

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------
