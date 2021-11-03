function [] = cpl1(opcode)
%CPL1 one's complement
%   opcode 0xF4 - acc, opcode 0xB3 - c/cy flag

acc = uint8(dba(0xE0));

if (opcode ~= 0xF4) && (opcode ~= 0xB3)
    error('wrong opcode in cpl function')
end

if opcode == 0xF4
    accbits = logical(bitand(acc,uint8([1,2,4,8,16,32,64,128])));
    accbits = ~accbits;
    acc = sum(accbits .* [1,2,4,8,16,32,64,128]);
    
    dba(0xE0,'w',acc);
end

if opcode == 0xB3
    c = psw('cy');
    c = ~c;
    psw('cy','w',c);
end

incrementpc();

end

