function [data] = readrom(address,bit)
%READROM gets byte at an address, optionally a specific bit; indexed at 0
%   returns empty on error
global EAp internal external

if ~exist('address','var')
    data = [];
    return
end
address=address+1;

if (address < 0x2000) && (EAp == true)
    data = internal(address);
else
    data = external(address);
end

if exist('bit','var')
    bit = bit+1;
    data = data(bit);
    return
end
end
