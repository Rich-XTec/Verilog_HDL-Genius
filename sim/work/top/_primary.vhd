library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clock           : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        SW              : in     vl_logic_vector(9 downto 0);
        LEDR_o          : out    vl_logic_vector(9 downto 0);
        HEX0_o          : out    vl_logic_vector(6 downto 0);
        HEX1_o          : out    vl_logic_vector(6 downto 0);
        HEX2_o          : out    vl_logic_vector(6 downto 0);
        HEX3_o          : out    vl_logic_vector(6 downto 0);
        HEX4_o          : out    vl_logic_vector(6 downto 0);
        HEX5_o          : out    vl_logic_vector(6 downto 0)
    );
end top;
