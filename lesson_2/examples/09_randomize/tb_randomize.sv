/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

`timescale 1ns/1ps

// Модуль для демонстрации работы std::randomize().
// Функция служит для рандомизации переменных
// различных типов.

//  ------------------ Важно! -------------------
// | Функция принимает произвольное количество   |
// | переменных для рандомизации.                |
//  ------------------ Важно! -------------------

module tb_randomize;
    bit [63:0] a;
    bit [ 7:0] b;

    initial begin
        repeat(8) begin
            std::randomize(a, b);
            #20;
        end
    end

endmodule
