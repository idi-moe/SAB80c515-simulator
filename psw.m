function [data] = psw(flag,dir,value)
%PSW R/W access to the program status word register (PSW)
%   Located at 0xD0, this register holds the 'cy' carry flag, 'ac' aux
%   carry flag (for bcd), 'f0' general purpose user flag 0, 'rs1' & 'rs0'
%   register bank select bits, 'ov' overflow flag, 'f1' general purpose
%   user flag, and 'p' parity flag, which is set/cleared each instr cycle
%   to indicate and odd/even # of one bits in the acc, i.e. even parity.
%   See page 25 of the Siemens SAB80C515 user manual. The layout is
%   cy,ac,f0,rs1,rs0,ov,f1,p from 0xD7 to 0xD0.

psw = dba(0xD0); %address of the psw in dba mode
bit = [];

if ~exist('dir','var')
    dir = 'r';
end

switch flag %remember that the lower level r/w functions index at 0!
    case 'cy'
        bit = 7;
    case 'ac'
        bit = 6;
    case 'f0'
        bit = 5;
    case 'rs1'
        bit = 4;
    case 'rs0'
        bit = 3;
    case 'ov'
        bit = 2;
    case 'f1'
        bit = 1;
    case 'p'
        bit = 0;
    otherwise
        error('psw read with invalid flag name')
end
        

if dir == 'r'
    data = readbit(psw,bit);
end

if dir == 'w'
    psw = writebit(psw,bit,value);
    dba(0xD0,'w',psw);
    data = [];
end
    
end

