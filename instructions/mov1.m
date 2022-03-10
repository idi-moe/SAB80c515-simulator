function [] = mov1(opcode)
%MOV1 one byte mov instructions
%   one machine cycle, which I think is 12 oscillator periods. copies the
%   byte from source to destination. mov dst,src. this was copied from
%   add1.m with some modification

acc = uint8(dba(0xE0));

if (opcode < 0xE6) || (opcode > 0xEF) || (opcode < 0xF6) || (opcode > 0xFF)
    error('wrong opcode in add function')
end

% move to acc
if (opcode > 0xE7) && (opcode < 0xF0)
    reg = opcode - 0xE8; %get Rn from opcode, who wants to do 8 switch/case
    val = uint8(registerN(reg));
end

switch opcode
    case 0xE6
        val = dba(registerN(0)); %remember, this is indirectly addressing ram
    case 0xE7
        val = dba(registerN(1));
end

% write to target from acc
if opcode > 0xF7
    reg = opcode - 0xF8; %get Rn from opcode, who wants to do 8 switch/case
    registerN(reg,'w',acc);
end

switch opcode
    case 0xF6
        dba(registerN(0),'w',acc); %remember, this is indirectly addressing ram
    case 0xF7
        dba(registerN(1),'w',acc);
end

% move to acc if needed. note opcode numbers here
if (opcode > 0xE5) || (opcode < 0xF0)
    dba(0xE0,'w',val);
end



incrementpc();


end

