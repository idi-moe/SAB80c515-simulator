function [] = hwreset()
%HWRESET reset the mcu w/o interrupting power, int ram preserved
%   Table 6-1 of the user manual, carry over some values.

global pc

%read memory state and write back undefined bits
PCON = dba(0x87);
PCON4 = readbit(PCON,4);
PCON = 0x00;
PCON = writebit(PCON,4,PCON4);
dba(0x87,'w',PCON);

IP0 = dba(0xA9);
IP07 = readbit(IP0,7);
IP0 = 0x00;
IP0 = writebit(IP0,7,IP07);
dba(0xA9,'w',IP0);

IP1 = dba(0xB9);
IP17 = readbit(IP1,7);
IP16 = readbit(IP1,6);
IP1 = 0x00;
IP1 = writebit(IP1,7,IP17);
IP1 = writebit(IP1,6,IP16);
dba(0xB9,'w',IP1);

%init sfr
dba(0x80,'w',0xFF); %P0, port 0
dba(0x81,'w',0x07); %SP, stack pointer
dba(0x90,'w',0xFF); %P1
dba(0xA0,'w',0xFF); %P2
dba(0xB0,'w',0xFF); %P3
dba(0xE8,'w',0xFF); %P4
dba(0xF8,'w',0xFF); %P5

pc = int16(zeros(1,1)); %fyi pc is not in memory
end

