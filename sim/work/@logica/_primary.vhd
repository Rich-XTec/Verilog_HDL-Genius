library verilog;
use verilog.vl_types.all;
entity Logica is
    port(
        REG_SetupLEVEL  : in     vl_logic_vector(1 downto 0);
        round           : in     vl_logic_vector(3 downto 0);
        REG_SetupMAPA   : in     vl_logic_vector(1 downto 0);
        points          : out    vl_logic_vector(7 downto 0)
    );
end Logica;
