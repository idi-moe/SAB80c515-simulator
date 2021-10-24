%include subfolders
addpath('instructions')

%allocate memory
global EAp internal external lowerintram upperintram sfr extdatamem
EAp = false; %external rom flag, 80c535=0
internal = zeros(0x2000,1);
external = zeros(0x10000,1);
lowerintram = zeros(0x80,1);
upperintram = zeros(0x80,1);
sfr = zeros(0x80,1);
extdatamem = zeros(0x10000,1);