library verilog;
use verilog.vl_types.all;
entity Counter_time is
    port(
        CLK1            : in     vl_logic;
        R               : in     vl_logic;
        E               : in     vl_logic;
        tempo           : out    vl_logic_vector(3 downto 0);
        end_time        : out    vl_logic
    );
end Counter_time;
