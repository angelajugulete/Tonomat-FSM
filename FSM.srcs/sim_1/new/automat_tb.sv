`timescale 1ns / 1ps

module automat_tb();

    logic RON1, RON5, RON10;
    logic CLK, RESET;
    logic PRODUS, R1, R5;

    automat DUT (
        .RON1(RON1),
        .RON5(RON5),
        .RON10(RON10),
        .CLK(CLK),
        .RESET(RESET),
        .PRODUS(PRODUS),
        .R1(R1),
        .R5(R5)
    );

    initial CLK = 0;
    always #5 CLK = ~CLK;

    initial begin

        RON1 = 0;
        RON5 = 0;
        RON10 = 0;
        RESET = 1;

        #10;
        RESET = 0;

        // Secven?? 1 RON1 -> RON1 -> RON1 => produs f?r? rest
        @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;

        @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;

        @(posedge CLK); RON1 = 1;
        @(posedge CLK); RON1 = 0;

        // Pauz?
        #20;

        // Secven?? RON5 => produs cu rest 1 RON
        @(posedge CLK); RON5 = 1;
        @(posedge CLK); RON5 = 0;

        // Pauz?
        #20;

        // Secven?? RON10 => produs cu rest 1 RON ?i 1 RON5
        @(posedge CLK); RON10 = 1;
        @(posedge CLK); RON10 = 0;

        // Pauz?
        #20;

        // Reset sistem
        @(posedge CLK); RESET = 1;
        @(posedge CLK); RESET = 0;

        // Închidere simulare
        #50;
        $finish;
    end

    // Afi?are stare în consol?
    initial begin
        $monitor("T=%0t | RON1=%b RON5=%b RON10=%b | PRODUS=%b R1=%b R5=%b",
                 $time, RON1, RON5, RON10, PRODUS, R1, R5);
    end

endmodule
