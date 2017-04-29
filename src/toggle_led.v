
module toggle_led (
    input wire clk,
    input wire rst,
    input wire toggle,
    output reg value= 1'b0
);

reg led = 1'b0;

always @(posedge clk)
begin
    value <= led;

    if (rst)
    begin
        led <= 1'b0;
    end
    else if (toggle)
    begin
        led <= ~led;
    end
end

endmodule
