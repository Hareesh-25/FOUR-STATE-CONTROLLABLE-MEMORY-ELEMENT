
module jk_flipflop (jk_if.dut_side bus);

    always @(posedge bus.clk or posedge bus.reset) begin
        if (bus.reset)
            bus.q <= 1'b0;
        else begin
            case ({bus.j, bus.k})
                2'b00: bus.q <= bus.q;
                2'b01: bus.q <= 1'b0;
                2'b10: bus.q <= 1'b1;
                2'b11: bus.q <= ~bus.q;
            endcase
        end
    end

endmodule
