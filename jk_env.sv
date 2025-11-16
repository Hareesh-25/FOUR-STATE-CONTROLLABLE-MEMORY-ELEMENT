class jk_env;
    virtual jk_if.tb_side vif;
    jk_driver     drv;
    jk_monitor    mon;
    jk_scoreboard sb;

    function new(virtual jk_if.tb_side vif);
        this.vif = vif;
        drv = new(vif);
        mon = new(vif);
        sb  = new();
    endfunction

    task run();
        jk_transaction tr;
        drv.apply_reset();
        fork
            mon.monitor_signals();
        join_none

        repeat (8) begin
            tr = new();
            assert(tr.randomize());
            drv.drive(tr);
            sb.check_output(tr, vif.cb.q);
        end
    endtask
endclass
