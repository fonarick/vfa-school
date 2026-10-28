/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

`timescale 1ns/1ps

// Модуль для демонстрации работы $urandom_range().
// Данная системная функция возвращает
// псевдослучайное 32-битное беззнаковое число
// в интервале, заданном входными аргументами.

//  ------------------- Важно! --------------------
// | Очередность аргументов не важна. Меньшнее     |
// | значение берется за начало интервала. Большее |
// | за конец.                                     |
//  ------------------- Важно! --------------------

module tb_urandom_range;
    bit [63:0] a;
    bit [ 7:0] b;

    initial begin
        repeat(8) begin
            a = $urandom_range(0,   512);
            b = $urandom_range(128, 512);
            #20;
        end
    end

endmodule
