%include subfolders
addpath('instructions')
addpath('micro-ops')

%allocate memory
global EAp internal external lowerintram upperintram sfr extdatamem pc
EAp = false; %external rom flag, 80c535=0
%if they have this uint8 type I think it all works
internal = uint8(zeros(0x2000,1));
external = uint8(zeros(0x10000,1));
lowerintram = uint8(zeros(0x80,1));
upperintram = uint8(zeros(0x80,1));
sfr = uint8(zeros(0x80,1));
extdatamem = uint8(zeros(0x10000,1));
pc = int16(zeros(1,1));

%init sfr
dba(0x80,'w',0xFF); %P0, port 0
dba(0x81,'w',0x07); %SP, stack pointer
dba(0x90,'w',0xFF); %P1
dba(0xA0,'w',0xFF); %P2
dba(0xB0,'w',0xFF); %P3
dba(0xE8,'w',0xFF); %P4
dba(0xF8,'w',0xFF); %P5

%import internal and external ROMs if needed here