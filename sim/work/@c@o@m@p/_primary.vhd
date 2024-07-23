library verilog;
use verilog.vl_types.all;
entity COMP is
    port(
        out_fpga        : in     vl_logic_vector(63 downto 0);
        out_user        : in     vl_logic_vector(63 downto 0);
        andCin          : out    vl_logic
    );
end COMP;
