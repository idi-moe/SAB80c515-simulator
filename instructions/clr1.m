function [] = clr1(opcode)
%CLR Implements both one bit CLR instructions
%   Oscillator period 12. CLR sets the target value to 0x00. The target can
%   be the accumulator, carry bit, or any directly addressable bit
%   (internal data ram or SFR)

if (opcode ~= 0xC3) || (opcode ~= 0xE4)
    error('wrong opcode in clr function')
end

if opcode == 0xc3
    psw('cy','w',0); %write 0 to carry bit
end

if opcode == 0xE4
    dba(0xE0,'w',0); %write 0 to accumulator
end

incrementpc();
end

