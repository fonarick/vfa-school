/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

`timescale 1ns/1ps

// Модуль для демонстрации работы $urandom().
// Данная системная функция возвращает
// псевдослучайное 32-битное беззнаковое число.

//  ---------------- Важно! -----------------
// | Случайным числом будет заполнена только |
// | младшая половина переменной ~a~. Пере-  |
// | менная ~b~ будет заполнена полностью.   |
//  ---------------- Важно! -----------------

module tb_urandom;

    bit [63:0] a;
    bit [ 7:0] b;

    initial begin
        repeat(8) begin
            a = $urandom();
            b = $urandom();
            #20;
        end
    end

endmodule
