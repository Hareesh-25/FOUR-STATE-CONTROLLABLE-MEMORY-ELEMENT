class jk_driver;
    virtual jk_if.tb_side vif;

    function new(virtual jk_if.tb_side vif);
        this.vif = vif;
    endfunction

    task apply_reset();
        vif.cb.reset <= 1;
        vif.cb.j <= 0;
        vif.cb.k <= 0;
        @(vif.cb);  
        @(vif.cb);  
        vif.cb.reset <= 0;
    endtask

    task drive(jk_transaction tr);
        vif.cb.j <= tr.j;
        vif.cb.k <= tr.k;
        @(vif.cb);  
    endtask
endclass
