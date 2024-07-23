library verilog;
use verilog.vl_types.all;
entity mux4x1_4b is
    port(
        ENT0_i          : in     vl_logic_vector(3 downto 0);
        ENT1_i          : in     vl_logic_vector(3 downto 0);
        ENT2_i          : in     vl_logic_vector(3 downto 0);
        ENT3_i          : in     vl_logic_vector(3 downto 0);
        SEL_i           : in     vl_logic_vector(1 downto 0);
        output_o        : out    vl_logic_vector(3 downto 0)
    );
end mux4x1_4b;
