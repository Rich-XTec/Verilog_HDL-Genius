library verilog;
use verilog.vl_types.all;
entity REG_fpga is
    generic(
        N               : integer := 64
    );
    port(
        data            : in     vl_logic_vector;
        CLK             : in     vl_logic;
        R               : in     vl_logic;
        E               : in     vl_logic;
        q_o             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end REG_fpga;
