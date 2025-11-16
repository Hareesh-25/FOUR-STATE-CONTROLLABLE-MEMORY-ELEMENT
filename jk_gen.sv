
class jk_gen;

    jk_transaction tr;

    function new();
        tr = new();
    endfunction

    function jk_transaction get_transaction();
        assert(tr.randomize());  
        return tr;
    endfunction

    task generate_sequence(int n, ref jk_transaction tr_list[$]);
        for (int i = 0; i < n; i++) begin
            jk_transaction t = get_transaction();
            tr_list.push_back(t);
        end
    endtask

endclass
