class jk_test;
    virtual jk_if.tb_side vif;
    jk_env env;

    function new(virtual jk_if.tb_side vif);
        this.vif = vif;
        env = new(vif);
    endfunction

    task run_test();
        env.run();
    endtask
endclass
