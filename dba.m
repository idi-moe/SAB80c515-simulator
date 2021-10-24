function [data] = dba(address,dir,data)
%DBA Read/Write Direct Byte Addressing, 0x00-0xFF. Use for Lower RAM and SFR
%   Returns the value of the byte or bit being addressed. Direction must be
%   'r' or 'w'. Indexed at 0.

global lowerintram sfr

if ~exist('dir','var')
    dir = 'r';
end

if (dir ~= 'r') && (dir ~= 'w')
    data = [];
    return
end
if (address > 0xFF) && (address < 0x00)
    data = [];
    return
end

if dir == 'r'
    if address < 0x7F
        address = address + 1;
        data = lowerintram(address);
    else
        address = address + 1 - 0x80; %offset things, due to having sfr as a different variable
        data = sfr(address);
    end
end

if dir == 'w'
    if address < 0x7F
        address = address + 1;
        lowerintram(address) = data;
    else
        address = address + 1 - 0x80;
        sfr(address) = data;
    end
    data = [];
end

end

