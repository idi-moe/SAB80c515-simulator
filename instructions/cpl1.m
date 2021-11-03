function [] = cpl1(opcode)
%CPL1 one's complement acc
%   opcode 0xF4

acc = uint8(dba(0xE0));

if opcode ~= 0xF4
    error('wrong opcode in cpl function')
end

accbits = logical(bitand(acc,uint8([1,2,4,8,16,32,64,128])));
accbits = ~accbits;
acc = sum(accbits .* [1,2,4,8,16,32,64,128]);

dba(0xE0,'w',acc);

incrementpc();

end

