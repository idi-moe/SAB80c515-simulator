%include subfolders
addpath('instructions')

%allocate memory
global EAp internal external lowerintram upperintram sfr extdatamem
EAp = false; %external rom flag, 80c535=0
internal = zeros(0x2000,1,'int8');
external = zeros(0x10000,1,'int8');
lowerintram = zeros(0x80,1,'int8');
upperintram = zeros(0x80,1,'int8');
sfr = zeros(0x80,1,'int8');
extdatamem = zeros(0x10000,1,'int8');

%init sfr
dba(0x80,'w',0xFF); %P0, port 0
dba(0x81,'w',0x07); %SP, stack pointer
dba(0x90,'w',0xFF); %P1
dba(0xA0,'w',0xFF); %P2
dba(0xB0,'w',0xFF); %P3
dba(0xE8,'w',0xFF); %P4
dba(0xF8,'w',0xFF); %P5