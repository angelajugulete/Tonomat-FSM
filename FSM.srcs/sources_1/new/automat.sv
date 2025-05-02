`timescale 1ns / 1ps

module automat (
    input  logic RON1, RON5, RON10,
    input  logic CLK, RESET,
    output logic PRODUS, R1, R5
);

    typedef enum logic [3:0] {
        S0 = 0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge CLK or posedge RESET) begin
        if (RESET)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always_comb begin

        next_state = current_state;
        PRODUS = 0;
        R1 = 0;
        R5 = 0;

        case (current_state)
            S0: begin
                if (RON1) next_state = S1;
                else if (RON5) next_state = S12;
                else if (RON10)next_state = S11;
            end
            S1: begin
                if (RON1) next_state = S2;
                else if (RON5) next_state = S9;
                else if (RON10)next_state = S10;
            end
            S2: begin
                if (RON1) next_state = S3;
                else if (RON5) next_state = S4;
                else if (RON10)next_state = S8;
            end
            S3: begin
                next_state = S0;
                PRODUS = 1;
            end
            S4: begin
                next_state = S5;
                PRODUS = 1;
                R1 = 1;
            end
            S5: begin
                next_state = S6;
                R1 = 1;
            end
            S6: begin
                next_state = S7;
                R1 = 1;
            end
            S7: begin
                next_state = S0;
                R1 = 1;
            end
            S8: begin
                next_state = S5;
                PRODUS = 1;
                R1 = 1;
                R5 = 1;
            end
            S9: begin
                next_state = S6;
                PRODUS = 1;
                R1 = 1;
            end
            S10: begin
                next_state = S6;
                PRODUS = 1;
                R1 = 1;
                R5 = 1;
            end
            S11: begin
                next_state = S7;
                PRODUS = 1;
                R1 = 1;
                R5 = 1;
            end
            S12: begin
                next_state = S7;
                PRODUS = 1;
                R1 = 1;
            end
        endcase
    end

endmodule
