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
        int a;
        bit b;
    } packet_s;

    mailbox#(packet_s) mbx;

    initial begin
        packet_s pkt; pkt.a = 100; pkt.b = 1'b1;
        mbx = new();
        #5;
        mbx.put(pkt); $display("%0t Put %0p", $time(), pkt);
    end

    initial begin
        packet_s pkt;
        #10;
        mbx.get(pkt); $display("%0t Get %0p", $time(), pkt);
    end

endmodule
