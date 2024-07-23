library verilog;
use verilog.vl_types.all;
entity Controle is
    port(
        R1_o            : out    vl_logic;
        R2_o            : out    vl_logic;
        E1_o            : out    vl_logic;
        E2_o            : out    vl_logic;
        E3_o            : out    vl_logic;
        E4_o            : out    vl_logic;
        SEL_o           : out    vl_logic;
        clock           : in     vl_logic;
        end_FPGA_i      : in     vl_logic;
        end_User_i      : in     vl_logic;
        end_time_i      : in     vl_logic;
        win_i           : in     vl_logic;
        match_i         : in     vl_logic;
        reset_i         : in     vl_logic;
        enter_i         : in     vl_logic
    );
end Controle;
