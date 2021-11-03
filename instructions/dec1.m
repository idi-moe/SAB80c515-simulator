function [] = dec1(opcode)
%DEC1 decrements target by one, can underflow. Operates on A, Rn, @Rn
%   opcodes 0x16-0x1F and 0x14



if (opcode < 0x16) || (opcode > 0x1F) && (opcode ~= 0x14)
    error('wrong opcode in add function')
end

if opcode > 0x17
    reg = opcode - 0x18; %get Rn from opcode, who wants to do 8 switch/case
    val = registerN(reg);
    val = mod(val-1,256);
    registerN(reg,'w',val);
end

switch opcode
    case 0x16
        val = dba(registerN(0)); %remember, this is indirectly addressing ram
        val = mod(val-1,256);
        dba(registerN(0),'w',val);
    case 0x17
        val = dba(registerN(1));
        val = mod(val-1,256);
        dba(registerN(1),'w',val);
    case 0x14
        acc = uint8(dba(0xE0));
        acc = mod(acc-1,256);
        dba(0xE0,'w',acc);
end


incrementpc();

end