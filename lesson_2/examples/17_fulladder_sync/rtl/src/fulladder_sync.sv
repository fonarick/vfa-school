/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

// Модуль синхронного полного сумматора.
module fulladder_sync (
    input  logic clk_i,
    input  logic areset_i,
    input  logic A_i,
    input  logic B_i,
    input  logic Cin_i,
    output logic Cout_o,
    output logic S_o
);

    always_ff @(posedge clk_i or posedge areset_i) begin
        if( areset_i ) begin
            {Cout_o, S_o} <= 'b0;
        end
        else begin
            S_o    <= A_i ^ B_i ^ Cin_i;
            Cout_o <= ( A_i & B_i ) | ( A_i & Cin_i ) |
                                      ( B_i & Cin_i );
        end
    end

endmodule
