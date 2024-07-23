library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clock           : in     vl_logic;
        KEY_i           : in     vl_logic_vector(3 downto 0);
        SW_i            : in     vl_logic_vector(7 downto 0);
        R1_i            : in     vl_logic;
        R2_i            : in     vl_logic;
        E1_i            : in     vl_logic;
        E2_i            : in     vl_logic;
        E3_i            : in     vl_logic;
        E4_i            : in     vl_logic;
        SEL_i           : in     vl_logic;
        LEDR_o          : out    vl_logic_vector(9 downto 0);
        end_FPGA_o      : out    vl_logic;
        end_User_o      : out    vl_logic;
        end_time_o      : out    vl_logic;
        win_o           : out    vl_logic;
        match_o         : out    vl_logic;
        HEX0_o          : out    vl_logic_vector(6 downto 0);
        HEX1_o          : out    vl_logic_vector(6 downto 0);
        HEX2_o          : out    vl_logic_vector(6 downto 0);
        HEX3_o          : out    vl_logic_vector(6 downto 0);
        HEX4_o          : out    vl_logic_vector(6 downto 0);
        HEX5_o          : out    vl_logic_vector(6 downto 0)
    );
end Datapath;
