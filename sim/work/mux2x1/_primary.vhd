library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        ENT0_i          : in     vl_logic_vector(6 downto 0);
        ENT1_i          : in     vl_logic_vector(6 downto 0);
        SEL_i           : in     vl_logic_vector(0 downto 0);
        output_o        : out    vl_logic_vector(6 downto 0)
    );
end mux2x1;
