interface jk_if(input logic clk);

    logic reset;
    logic j;
    logic k;
    logic q;

    clocking cb @(posedge clk);
        output reset, j, k;
        input  q;
    endclocking

    modport dut_side (input clk, reset, j, k, output q);

    modport tb_side (
        clocking cb,       
        input  j, k, reset, 
        input  q
    );

endinterface
