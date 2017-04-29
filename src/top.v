
//
// A Game for the Digilent Arty FPGA
// The goal of the game is to light all four leds by pressing the four buttons.
// Each button toggles multiple leds.
// Copytight Mathias Olsson 2017
// MIT License
//

module ledgame(
        input wire clk,
        input wire [3:0] btn, // Buttons on the board
        output wire [3:0] led // Leds on the board
    );

wire [3:0] pressed;
wire [3:0] toggle;

// Led 0 is controlled by
assign toggle[0] = pressed[0] || pressed[1]; // LD4
// Led 1 is controlled by 
assign toggle[1] = pressed[1] || pressed[2]; // LD5
// Led 2 is controlled by 
assign toggle[2] = pressed[2] || pressed[3]; // LD6
// Led 3 is controlled by 
assign toggle[3] = pressed[3] || pressed[0]; // LD7


detect_button dbi_0(
    .clk(clk),
    .init(1'b0),
    .button(btn[0]),
    .pressed(pressed[0])
    );

detect_button dbi_1(
    .clk(clk),
    .init(1'b1),
    .button(btn[1]),
    .pressed(pressed[1])
    );

detect_button dbi_2(
    .clk(clk),
    .init(1'b1),
    .button(btn[2]),
    .pressed(pressed[2])
    );

detect_button dbi_3(
    .clk(clk),
    .init(1'b0),
    .button(btn[3]),
    .pressed(pressed[3])
    );

toggle_led tli_0(
    .clk(clk),
    .rst(rst),
    .toggle(toggle[0]),
    .value(led[0])
    );

toggle_led tli_1(
    .clk(clk),
    .rst(rst),
    .toggle(toggle[1]),
    .value(led[1])
    );

toggle_led tli_2(
    .clk(clk),
    .rst(rst),
    .toggle(toggle[2]),
    .value(led[2])
    );

toggle_led tli_3(
    .clk(clk),
    .rst(rst),
    .toggle(toggle[3]),
    .value(led[3])
    );


always @(posedge clk)
begin

end

endmodule
