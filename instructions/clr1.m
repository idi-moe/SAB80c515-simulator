function [] = clr1(opcode)
%CLR1 CLR C 0xC3, sets carry bit to 0
%   Detailed explanation goes here


if (opcode ~= 0xC3)
    error('wrong opcode in clr function')
end


psw('cy','w',0);
incrementpc();
end

