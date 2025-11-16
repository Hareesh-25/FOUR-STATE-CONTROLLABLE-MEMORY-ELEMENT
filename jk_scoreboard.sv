class jk_scoreboard;
    bit last_q;

    function new();
        last_q = 0;
    endfunction

    function bit predict(bit j, bit k);
        case ({j, k})
            2'b00: predict = last_q;
            2'b01: predict = 0;
            2'b10: predict = 1;
            2'b11: predict = ~last_q;
        endcase
        last_q = predict;
    endfunction

    task check_output(jk_transaction tr, bit actual_q);
        bit expected = predict(tr.j, tr.k);
        if (expected !== actual_q)
            $display("[%0t] ❌ MISMATCH: J=%b K=%b Expected=%b Got=%b",
                     $time, tr.j, tr.k, expected, actual_q);
        else
            $display("[%0t] ✅ MATCH: J=%b K=%b Output=%b",
                     $time, tr.j, tr.k, actual_q);
    endtask
endclass
