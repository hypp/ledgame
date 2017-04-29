`timescale 1 ns/1 ps

module detect_button_tb();

reg tb_clk;
reg tb_rst;

reg tb_button;
wire tb_pressed;

detect_button dbi_0(
    .clk(tb_clk),
    .init(1'b1),
    .button(tb_button),
    .pressed(tb_pressed)
    );

initial
begin
    tb_clk <= 1'b0;
    tb_rst <= 1'b0;
    tb_button <= 1'b0;
end

// Toggle clock every 5 nanoseconds
always
begin
    #5 tb_clk <= ~tb_clk;
end

always
begin
    #100 tb_button <= ~tb_button;
end

endmodule
