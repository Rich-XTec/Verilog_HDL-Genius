library verilog;
use verilog.vl_types.all;
entity REG_setup is
    port(
        SW              : in     vl_logic_vector(7 downto 0);
        CLK             : in     vl_logic;
        R               : in     vl_logic;
        E               : in     vl_logic;
        setup           : out    vl_logic_vector(7 downto 0)
    );
end REG_setup;
