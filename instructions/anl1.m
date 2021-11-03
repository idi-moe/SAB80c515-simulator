function [] = anl1(opcode)
%ANL1 Logical-AND for byte variables
%   bitwise AND, no flags used. opcodes 0x56-0x5F


acc = uint8(dba(0xE0));

if (opcode < 0x56) || (opcode > 0x5F)
    error('wrong opcode in anl function')
end

if opcode > 0x57
    reg = opcode - 0x58; %get Rn from opcode, who wants to do 8 switch/case
    val = uint8(registerN(reg));
end

switch opcode
    case 0x56
        val = dba(registerN(0)); %remember, this is indirectly addressing ram
    case 0x57
        val = dba(registerN(1));
end

%accbits = logical(bitand(acc,uint8([1,2,4,8,16,32,64,128])));
%valbits = logical(bitand(val,uint8([1,2,4,8,16,32,64,128])));

acc = bitand(acc,val);


dba(0xE0,'w',acc);

incrementpc();

end
