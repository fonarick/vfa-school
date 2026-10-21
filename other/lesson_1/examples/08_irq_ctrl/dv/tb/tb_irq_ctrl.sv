/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

`timescale 1ns/1ps

// Топ-модуль простейшего верификационного
// окружения комбинационного контроллера
// прерываний.

//  ------------------ Важно! --------------------
// | Данный модуль является примером недостатка   |
// | знаний о возможностях SystemVerilog для      |
// | верификации. В нем много однотипных кон-     |
// | струкций, которые могут быть оптимизированы. |
// | Количество кода может быть значительно       |
// | уменьшено.                                   |
//  ------------------ Важно! --------------------

//  ------------------ Важно! --------------------
// | Хоть данный модуль и не является написанным  |
// | оптимально, он выполняет свою функцию про-   |
// | верки. Однако, дублирование однотипных кон-  |
// | струкций часто приводит к увеличению времен- |
// | ных затрат, увеличению вероятности ошибки    |
// | в окружении, а также к увеличению сложности  |
// | восприятия кода.                             |
//  ------------------ Важно! --------------------

module tb_irq_ctrl;

    // Определение проводов, которые будут
    // подключены к портам контроллера.
    // В большинстве случаев названия
    // этих проводов дублируют названия
    // портов.
    logic [2:0] reqs_i;
    logic       mode_i;
    logic [2:0] reqs_o;

    // Подключение модуля irq_ctrl.
    irq_ctrl DUT (
        .reqs_i (reqs_i ),
        .mode_i (mode_i ),
        .reqs_o (reqs_o )
    );

    // Генерируем входные воздействия,
    // ожидаем, проверяем выходные
    // значения.

    //  ------------- Важно! -------------
    // | В коде ниже достаточно много     |
    // | однотипных конструкций, он не    |
    // | является оптимальным. Однако     |
    // | является достаточным для         |
    // | объяснения простейших концепций. |
    //  ------------- Важно! -------------

    initial begin

        // Режим младшей единицы.
        mode_i = 1'b0;

        // Входные сигналы.
        reqs_i = 3'b000;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b000 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b000);
        end

        // Входные сигналы.
        reqs_i = 3'b001;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b001 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b001);
        end

        // Входные сигналы.
        reqs_i = 3'b010;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b010 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b010);
        end

        // Входные сигналы.
        reqs_i = 3'b011;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b001 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b001);
        end

        // Входные сигналы.
        reqs_i = 3'b100;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b100 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b100);
        end

        // Входные сигналы.
        reqs_i = 3'b101;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b001 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b001);
        end

        // Входные сигналы.
        reqs_i = 3'b110;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b010 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b010);
        end

        // Входные сигналы.
        reqs_i = 3'b111;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b001 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b001);
        end

        // Режим старшей единицы.
        mode_i = 1'b1;

        // Входные сигналы.
        reqs_i = 3'b000;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b000 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b000);
        end

        // Входные сигналы.
        reqs_i = 3'b001;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b001 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b001);
        end

        // Входные сигналы.
        reqs_i = 3'b010;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b010 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b010);
        end

        // Входные сигналы.
        reqs_i = 3'b011;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b010 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b010);
        end

        // Входные сигналы.
        reqs_i = 3'b100;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b100 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b100);
        end

        // Входные сигналы.
        reqs_i = 3'b101;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b100 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b100);
        end

        // Входные сигналы.
        reqs_i = 3'b110;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b100 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b100);
        end

        // Входные сигналы.
        reqs_i = 3'b111;

        // Ожидание.
        #20ns;

        // Проверка.
        if( reqs_o !== 3'b100 ) begin
            $error("Invalid reqs_o! Real: %3b, Expected: %3b", reqs_o, 3'b100);
        end

        // Завершение.
        $finish();

    end

endmodule
