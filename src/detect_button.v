
module detect_button (
    input wire clk,
    input wire init,
    input wire button,
    output reg [0:0] pressed
);

reg [0:0] updown = 1'b0;
reg [0:0] start = 1'b1;

always @(posedge clk)
begin
    pressed <= 1'b0;
    start <= 1'b0;
    
    if (start == 1'b1)
    begin
        updown <= init;
        pressed <= init;
    end
    
    if (button != updown)
    begin
        updown <= button;
        pressed <= button;
    end
end

endmodule
