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

//  ------------------ Важно! -------------------
// | Вне зависимости от корневого зерна процесс  |
// | будет генерировать одну и ту же последова-  |
// | тельность, так реинициализируется при по-   |
// | мощи $urandom() с фиксированным аргументом. |
//  ------------------ Важно! -------------------

module tb_urandom;
    bit [63:0] a;
    bit [ 7:0] b;

    initial begin
        $urandom(10);
        repeat(8) begin
            a = $urandom();
            b = $urandom();
            #20;
        end
    end

endmodule
