function [] = addc1(opcode)
%ADDC1 Implements all 10 one-byte addc instructions of two types
%   Oscillator period 12. ADDC (A,Rn), ADDC (A,@Ri). CY set if carry-out from
%   bit 7, AC if carry-out from bit 3. OV if carry-out of bit 6 not 7, or 7
%   not 6. The flags are overwritten from this instruction, with 0s if
%   needed. No state is preserved from the previos ops. Opcodes 0x36-0x3F

acc = uint8(dba(0xE0));
cy = psw('cy');

if (opcode < 0x36) || (opcode > 0x3F)
    error('wrong opcode in addc function')
end

if opcode > 0x37
    reg = opcode - 0x38; %get Rn from opcode, who wants to do 8 switch/case
    val = uint8(registerN(reg));
end

switch opcode
    case 0x36
        val = dba(registerN(0)); %remember, this is indirectly addressing ram
    case 0x37
        val = dba(registerN(1));
end

accbits = logical(bitand(acc,uint8([1,2,4,8,16,32,64,128]))); %for the flags
valbits = logical(bitand(val,uint8([1,2,4,8,16,32,64,128])));

acc = mod(acc+val+cy,256);

if (accbits(7) == 1) && (valbits(7) == 1)
    psw('cy','w',true);
end
if (accbits(3) == 1) && (valbits(3) == 1)
    psw('ac','w',true);
end
if (accbits(6) == ~valbits(7)) || (valbits(6) == ~accbits(7))
    psw('ov','w',true);
end

dba(0xE0,'w',acc);

incrementpc();

end
