/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

//  -------------------- TODO ---------------------
// | Опишите классы в соответствии с требованиями. |
// | Запустите симуляцию данного файла.            |
//  -------------------- TODO ---------------------

module tb_classes;

	//  ---------------------- TODO -----------------------
	// | Пример класса для верификации делителя.           |
	// |                                                   |
	// | Создайте поля:                                    |
	// |   - bit [31:0] dividend;                          |
	// |   - bit [ 7:0] divider;                           |
	// |                                                   |
	// | Опишите ограничения такие, что:                   |
	// |   1) ~divider~ больше 0;                          |
	// |   2) ~dividend~ делится на ~divider~ без остатка; |
	// |   3) ~dividend~ больше ~divider~.                 |
	//  ---------------------- TODO -----------------------

	class my_class_1;
		rand bit [31:0] dividend;
		rand bit [7:0] divider;
		constraint c_stimulus                               {
			divider > 0										;
			(dividend % divider) == 0						;
			dividend > divider								;
		}
	endclass

	//  ----------------------- TODO ----------------------
	// | Пример класса для обращения по адресу.            |
	// |                                                   |
	// | Создайте поля:                                    |
	// |   - logic [31:0] data;                            |
	// |   - logic [ 7:0] addr;                            |
	// |                                                   |
	// | Опишите ограничения такие, что:                   |
	// |   1) если ~data~ равен нулю, то ~addr~ равен 128; |
	// |   2) ~data~ является степенью 2 или равен 0;      |
	// |   3) при ~data~ != 0: ~addr~ меньше 64.           |
	//  ----------------------- TODO ----------------------

	class my_class_2;
		rand logic [31:0]			data					;
		rand logic [7:0]			addr					;
		constraint c_stimulus								{
			if (data == 0)
				addr		  =	128							;
			else
				addr		  <	64							;
			$countones(data) <=	1							;
		}
	endclass

	//  -------------------------- TODO -------------------------
	// | Пример рандомизации массива с особыми ограничениями.    |
	// |                                                         |
	// | Создайте поля:                                          |
	// |   - int data [];                                        |
	// |                                                         |
	// | Опишите ограничения такие, что:                         |
	// |   1) размер массива четный;                             |
	// |   2) размер массива меньше 10 и больше 0;               |
	// |   3) каждый элемент массива меньше 200;                 |
	// |   4) если индекс элемента четный - элемент тоже четный. |
	//  -------------------------- TODO -------------------------

	class my_class_3;
		rand int					data				  [];
		constraint c_stimulus								{
			data.size() % 2	 ==	0							;
			data.size()		  > 0							;
			data.size()		  < 10							;
			foreach (data[i])								{
				data[i]		  <	200							;
				if (i % 2 == 0)
					data[i] % 2 == 0						;
			}
		}
	endclass

	//  --------------------------- TODO --------------------------
	// | Пример рандомизации массива с рандомизацией его размера   |
	// | через отдельное поле.                                     |
	// |                                                           |
	// | Создайте поля:                                            |
	// |   - bit [1:0] size;                                       |
	// |   - bit [7:0] data [];                                    |
	// |                                                           |
	// | Опишите ограничения такие, что:                           |
	// |   1) размер 'data' равен 'size';                          |
	// |   2) 'size' больше 0;                                     |
	// |   3) если 'size' равен 3, то все элементы 'data' равны 0, |
	// |      иначе каждый элемент 'data' уникален;                |
	//  --------------------------- TODO --------------------------

	class my_class_4;
		rand bit [1:0]				size					;
		rand bit [7:0]				data				  [];
		constraint c_stimulus								{
			data.size()		 ==	size						;
			size			  >	0							;
			if (size == 3)
				foreach (data[i])
					data[i]	 ==	0							;
			else
				foreach (data[i])
					foreach (data[j])
						if (i < j)
							data[i] != data[j]				;
		}
	endclass

	//  ------------------------------ TODO ------------------------------
	// | Пример класса для верификации памяти.                            |
	// |                                                                  |
	// | Создайте поля:                                                   |
	// |   - bit [7:0] data;                                              |
	// |   - bit [7:0] addr;                                              |
	// |   - bit req;                                                     |
	// |   - bit we;                                                      |
	// |                                                                  |
	// | Опишите ограничения такие, что:                                  |
	// |   1) адрес выровнен на 4 байта (младшие 2 бита равны 0);         |
	// |   2) если 'req' равен 1, то 'data' в интервале от 128 до 200;    |
	// |   3) если 'req' и 'we' равны 1, то 'addr' меньше 128.            |
	//  ------------------------------ TODO ------------------------------

	class my_class_5;
		rand bit [7:0]			data						;
		rand bit [7:0]			addr						;
		rand bit				req							;
		rand bit				we							;
		constraint c_stimulus								{
			addr[1:0]		 ==	0							;
			if (req)
				data inside		{128:200}					;
			if (req && we)
				addr		  < 128							;
		}
	endclass

	//  ------------------- TODO ------------------------
	// | Пример класса пакета для AMBA AXI-Stream.       |
	// |                                                 |
	// | Создайте поля:                                  |
	// |   - bit [31:0] tdata [];                        |
	// |   - bit        tid;                             |
	// |   - bit        tlast [];                        |
	// |                                                 |
	// | Опишите ограничения такие, что:                 |
	// |   1) размер 'tdata' равен размеру 'tlast';      |
	// |   2) размеры 'tdata' и 'tlast' больше 0 и не    |
	// |      больше 32;                                 |
	// |   3) размеры 'tdata' и 'tlast' кратны 8;        |
	// |   4) 'tlast', равный 1, появляется в массиве не |
	// |      чаще, чем раз в 4 значения.                |
	//  ------------------- TODO ------------------------

	class my_class_6;
		rand bit [31:0]			tdata					  [];
		rand bit				tid							;
		rand bit				tlast					  [];
		constraint c_stimulus								{
			tdata.size()	 ==	tlast.size()				;
			tdata.size() inside {[1:32]}					;
			tdata.size() % 8 ==	0							;
			foreach (tlast[i])
				foreach (tlast[j])
					if ((i < j) && ((j - i) < 4))
						!(tlast[i] && tlast[j]);
		}
	endclass

	`include "checker.svhp"

endmodule
