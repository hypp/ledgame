`timescale 1 ns/1 ps

module toggle_led_tb();

reg tb_clk;
reg tb_rst;

reg tb_toggle;
wire tb_value;

toggle_led tli_0(
    .clk(tb_clk),
    .rst(tb_rst),
    .toggle(tb_toggle),
    .value(tb_value)
    );

initial
begin
    tb_clk <= 1'b0;
    tb_rst <= 1'b0;
    tb_toggle <= 1'b0;
end

// Toggle clock every 5 nanoseconds
always
begin
    #5 tb_clk <= ~tb_clk;
end

always
begin
    #100 tb_toggle <= ~tb_toggle;
end

endmodule
