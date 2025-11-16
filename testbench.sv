// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
`include "jk_if.sv"
`include "jk_transaction.sv"
`include "jk_driver.sv"
`include "jk_monitor.sv"
`include "jk_scoreboard.sv"
`include "jk_env.sv"
`include "jk_test.sv"
module tb_jk_flipflop;

    logic clk;
    jk_if intf(clk);
    jk_flipflop dut (intf);

    jk_test test;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("jk_class_based.vcd");
        $dumpvars(0, tb_jk_flipflop);

        test = new(intf);
        test.run_test();

        #200 $finish;
    end

endmodule
