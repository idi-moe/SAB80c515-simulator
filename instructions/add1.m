function [] = add1(opcode)
%ADD1 Implements all 10 one-byte add instructions of two types
%   Oscillator period 12. Add (A,Rn), A(A,@Ri). CY set if carry-out from
%   bit 7, AC if carry-out from bit 3. OV if carry-out of bit 6 not 7, or 7
%   not 6. The flags are overwritten from this instruction, with 0s if
%   needed. No state is preserved from the previos ops.

acc = uint8(dba(0xE0));

if (opcode < 0x26) || (opcode > 0x2F)
    error('wrong opcode in add function')
end

if opcode > 0x27
    reg = opcode - 0x28; %get Rn from opcode, who wants to do 8 switch/case
    val = uint8(registerN(reg));
end

switch opcode
    case 0x26
        val = dba(registerN(0)); %remember, this is indirectly addressing ram
    case 0x27
        val = dba(registerN(1));
end

accbits = logical(bitand(acc,uint8([1,2,4,8,16,32,64,128]))); %for the flags
valbits = logical(bitand(val,uint8([1,2,4,8,16,32,64,128])));

%{
if acc+val > 0xFF
    corr = 128;
else
    corr = 0;
end

acc = acc + val - corr; %why corr you ask? overflow reasons
%}

%fine, butwise code



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

