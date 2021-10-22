function [data] = dba(address,dir,bit,data)
%DBA Read/Write Direct Byte Addressing, 0x00-0xFF. Use for Lower RAM and SFR
%   Returns the value of the byte or bit being addressed. Returns a 0 if
%   the write was successful. Returns empty on invalid input. Direction must be
%   'r' or 'w'. Indexed at 0.

global lowerintram sfr

if (dir ~= 'r') && (dir ~= 'w')
    data = [];
    return;
end
if (address > 0xFF) && (address < 0x00)
    data = [];
    return;
end

if dir == 'r'
    if address < 0x7F
        address = address + 1;
        data = lowerintram(address);
    else
        address = address + 1 - 0x80;
        data = sfr(address);
    end
    if exist('bit','var')
        bit = bit+1;
        data = data(bit);
    return
    end
end

end

