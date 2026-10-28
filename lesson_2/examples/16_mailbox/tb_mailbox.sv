/***************************************************
 * Copyright © 2026 Sergey Chusov.
 * Version 1.0.0.
 * Licensed under CC BY-NC-ND 4.0
 * (Attribution-NonCommercial-NoDerivatives).
 * https://creativecommons.org/licenses/by-nc-nd/4.0
 * SPDX-License-Identifier: CC-BY-NC-ND-4.0
 ***************************************************/

module tb_mailbox;

    typedef struct {
        rand bit [7:0] a;
             bit [7:0] b;
    } packet_s;

    mailbox#(packet_s) mbx = new();

    initial begin
        packet_s pkt;
        repeat(5) begin
            void'(std::randomize(pkt));
            mbx.put(pkt); $display("%0t Put %0p", $time(), pkt);
        end
    end

    initial begin
        packet_s pkt;
        repeat(5) begin
            mbx.get(pkt); $display("%0t Get %0p", $time(), pkt);
        end
    end

endmodule
