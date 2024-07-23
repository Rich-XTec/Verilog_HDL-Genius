library verilog;
use verilog.vl_types.all;
entity ButtonSync is
    port(
        KEY0            : in     vl_logic;
        KEY1            : in     vl_logic;
        KEY2            : in     vl_logic;
        KEY3            : in     vl_logic;
        CLK             : in     vl_logic;
        BTN0            : out    vl_logic;
        BTN1            : out    vl_logic;
        BTN2            : out    vl_logic;
        BTN3            : out    vl_logic
    );
end ButtonSync;
