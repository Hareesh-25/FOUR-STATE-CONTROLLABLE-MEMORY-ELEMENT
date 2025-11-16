class jk_transaction;
    rand bit j;
    rand bit k;
    bit expected_q;

    function void display(string tag);
        $display("[%0t] %s : J=%b K=%b Expected_Q=%b", $time, tag, j, k, expected_q);
    endfunction
endclass
