module tutorial_led_blink
(
    i_clock,
    i_enable,
    i_switch_1,
    i_switch_2,
    o_led_drive
    );

    input i_clock;
    input i_enable;
    input i_switch_1;
    input i_switch_2;
    output o_led_drive;

    parameter C_CNT_100HZ = 125;
    parameter C_CNT_50HZ = 250;
    parameter C_CNT_10HZ = 1250;
    parameter C_CNT_1HZ = 12500;

    reg [31:0] r_CNT_100HZ = 0;
    reg [31:0] r_CNT_50HZ = 0;
    reg [31:0] r_CNT_10HZ = 0;
    reg [31:0] r_CNT_1HZ = 0;

    reg r_TOGGLE_100HZ = 1'b0;
    reg r_TOGGLE_50HZ = 1'b0;
    reg r_TOGGLE_10HZ = 1'b0;
    reg r_TOGGLE_1HZ = 1'b0;

    reg r_LED_SELECT;
    wire w_LED_SELECT;

begin

    always @ (posedge i_clock)
        begin
            if(r_CNT_100HZ == C_CNT_100HZ-1)
                begin
                    r_TOGGLE_100HZ <= !r_TOGGLE_100HZ;
                    r_CNT_100HZ <= 0;
                end
            else
                r_CNT_100HZ <= r_CNT_100HZ + 1;
        end

    always @ (posedge i_clock)
        begin
            if(r_CNT_50HZ == C_CNT_50HZ-1)
                begin
                    r_TOGGLE_50HZ <= !r_TOGGLE_50HZ;
                    r_CNT_50HZ <= 0;
                end
            else
                r_CNT_50HZ <= r_CNT_50HZ + 1;
        end

    always @ (posedge i_clock)
        begin
            if(r_CNT_10HZ == C_CNT_10HZ-1)
                begin
                    r_TOGGLE_10HZ <= !r_TOGGLE_10HZ;
                    r_CNT_10HZ <= 0;
                end
            else
                r_CNT_10HZ <= r_CNT_10HZ + 1;
        end

    always @ (posedge i_clock)
        begin
            if(r_CNT_1HZ == C_CNT_1HZ-1)
                begin
                    r_TOGGLE_1HZ <= !r_TOGGLE_1HZ;
                    r_CNT_1HZ <= 0;
                end
            else
                r_CNT_1HZ <= r_CNT_1HZ + 1;
        end

    always @ (*)
    begin
        case({i_switch_1, i_switch_2})
            2'b11 : r_LED_SELECT <= r_TOGGLE_1HZ;
            2'b10 : r_LED_SELECT <= r_TOGGLE_10HZ;
            2'b01 : r_LED_SELECT <= r_TOGGLE_50HZ;
            2'b00 : r_LED_SELECT <= r_TOGGLE_100HZ;
        endcase
    end

    assign o_led_drive = r_LED_SELECT & i_enable;

    end
endmodule
