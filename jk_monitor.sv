class jk_monitor;
    virtual jk_if.tb_side vif;

    function new(virtual jk_if.tb_side vif);
        this.vif = vif;
    endfunction

    task monitor_signals();
        forever begin
            @(vif.cb); 
            $display("[%0t] MONITOR: J=%b K=%b Q=%b Reset=%b",
                     $time, vif.j, vif.k, vif.q, vif.reset);
        end
    endtask
endclass
