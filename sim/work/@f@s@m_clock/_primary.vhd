library verilog;
use verilog.vl_types.all;
entity FSM_clock is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        clk_5           : out    vl_logic;
        clk_3           : out    vl_logic;
        clk_2           : out    vl_logic;
        clk_1           : out    vl_logic
    );
end FSM_clock;
