library verilog;
use verilog.vl_types.all;
entity Counter_round is
    port(
        clk             : in     vl_logic;
        R               : in     vl_logic;
        data            : in     vl_logic_vector(3 downto 0);
        E               : in     vl_logic;
        tc_o            : out    vl_logic;
        ROUND           : out    vl_logic_vector(3 downto 0)
    );
end Counter_round;
