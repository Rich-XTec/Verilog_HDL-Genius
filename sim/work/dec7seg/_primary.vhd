library verilog;
use verilog.vl_types.all;
entity dec7seg is
    port(
        G_i             : in     vl_logic_vector(3 downto 0);
        O_o             : out    vl_logic_vector(6 downto 0)
    );
end dec7seg;
