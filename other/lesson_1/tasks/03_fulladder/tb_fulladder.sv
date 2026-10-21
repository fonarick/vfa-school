/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

// Топ-модуль простейшего верификационного
// окружения полного комбинационного сумматора.

//  -------------------- Важно! ---------------------
// | Данный модуль эквивалентен модулю по пути       |
// | lesson_1/examples/01_fulladder/tb_fulladder.sv  |
// | с точки зрения генерации входных значений.      |
// | Однако в текущем модуле добавлены проверки      |
// | выходных сигналов.                              |
// | Данный модуль можно считать полноценным         |
// | верификационным окружением. Обратите внимание,  |
// | что проверяется поведение полного сумматора     |
// | на всех возможных сочетаниях входных сигналов.  |
//  -------------------- Важно! ---------------------

module tb_fulladder;

    // Определение проводов, которые будут
    // подключены к портам сумматора.
    // В большинстве случаев названия
    // этих проводов дублируют названия
    // портов.
    logic A_i;
    logic B_i;
    logic Cin_i;
    logic Cout_o;
    logic S_o;
    
    // Подключение модуля сумматора.
    fulladder DUT (
        .A_i    ( A_i    ),
        .B_i    ( B_i    ),
        .Cin_i  ( Cin_i  ),
        .Cout_o ( Cout_o ),
        .S_o    ( S_o    )
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

        // Входные сигналы.
        A_i   = 1'bx;
        B_i   = 1'bx;
        Cin_i = 1'bx;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'bx ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'bx);
        end
        if( S_o !== 1'bx ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'bx);
        end

        // Входные сигналы.
        A_i   = 1'b0;
        B_i   = 1'b0;
        Cin_i = 1'b0;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b0 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b0);
        end
        if( S_o !== 1'b0 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b0);
        end

        // Входные сигналы.
        A_i   = 1'b1;
        B_i   = 1'b0;
        Cin_i = 1'b0;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b0 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b0);
        end
        if( S_o !== 1'b1 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b1);
        end

        // Входные сигналы.
        A_i   = 1'b0;
        B_i   = 1'b1;
        Cin_i = 1'b0;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b0 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b0);
        end
        if( S_o !== 1'b1 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b1);
        end

        // Входные сигналы.
        A_i   = 1'b1;
        B_i   = 1'b1;
        Cin_i = 1'b0;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b1 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b1);
        end
        if( S_o !== 1'b0 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b0);
        end

        // Входные сигналы.
        A_i   = 1'b0;
        B_i   = 1'b0;
        Cin_i = 1'b1;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b0 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b0);
        end
        if( S_o !== 1'b1 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b1);
        end

        // Входные сигналы.
        A_i   = 1'b1;
        B_i   = 1'b0;
        Cin_i = 1'b1;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b1 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b1);
        end
        if( S_o !== 1'b0 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b0);
        end

        // Входные сигналы.
        A_i   = 1'b0;
        B_i   = 1'b1;
        Cin_i = 1'b1;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b1 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b1);
        end
        if( S_o !== 1'b0 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b0);
        end

        // Входные сигналы.
        A_i   = 1'b1;
        B_i   = 1'b1;
        Cin_i = 1'b1;

        // Ожидание.
        #20ns;

        // Проверка.
        if( Cout_o !== 1'b1 ) begin
            $error("Invalid Cout_o! Real: %1b, Expected: %1b", Cout_o, 1'b1);
        end
        if( S_o !== 1'b1 ) begin
            $error("Invalid S_o! Real: %1b, Expected: %1b", S_o, 1'b1);
        end

        // Завершение.
        $finish();

    end

endmodule
