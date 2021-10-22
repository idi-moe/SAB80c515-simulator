function [byteout] = writebit(byte,bit,value)
%WRITEBIT writes a bit to a given byte (int), bit is index'd at 0
%   Detailed explanation goes here
bits = logical(bitand(byte,[128,64,32,16,8,4,2,1]));
bit=bit+1;
bits(bit) = logical(value);
byteout = sum(bits .* [128,64,32,16,8,4,2,1]);
end