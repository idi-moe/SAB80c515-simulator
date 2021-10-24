function [byte] = registerN(n,dir,data)
%REGISTERN Accesses Rn and handles RB automatically
%   In the lower 128 bytes of RAM (DBA), there are 4 register banks. When
%   you access Rn, the address returned depends on which bank is selected.
%   This function handles the selection automatically. RS0 is LSB.

if ~exist('dir','var')
    dir = 'r';
end

rs0 = psw('rs0');
rs1 = psw('rs1');

address = (2*rs1+rs0)*8+n;
%   nifty I think, convert rs0&rs1 into decimal,
%   multiply by 8 to get the address of the
%   start of the bank, and then add n, the
%   target register to get the address required

byte = dba(address,dir,data);

end

