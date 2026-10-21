/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

// Модуль полного сумматора.
module fulladder (
    input  logic A_i,
    input  logic B_i,
    input  logic Cin_i,
    output logic Cout_o,
    output logic S_o
);

    assign S_o    = A_i ^ B_i ^ Cin_i;
    // error
    //  assign Cout_o = ( A_i & B_i ) | ( A_i & Cin_i ) & ( B_i & Cin_i );
    assign Cout_o = ( A_i & B_i ) | ( A_i & Cin_i ) | ( B_i & Cin_i );

endmodule
