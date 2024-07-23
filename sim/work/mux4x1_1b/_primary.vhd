library verilog;
use verilog.vl_types.all;
entity mux4x1_1b is
    port(
        CL0_i           : in     vl_logic;
        CL1_i           : in     vl_logic;
        CL2_i           : in     vl_logic;
        CL3_i           : in     vl_logic;
        level_i         : in     vl_logic_vector(1 downto 0);
        CLKHZ_o         : out    vl_logic
    );
end mux4x1_1b;
