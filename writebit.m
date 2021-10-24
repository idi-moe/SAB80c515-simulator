function [byteout] = writebit(byte,bit,value)
%WRITEBIT writes a bit to a given byte (int), bit is index'd at 0
%   Detailed explanation goes here
bits = logical(bitand(byte,[1,2,4,8,16,32,64,128]));
bit=bit+1;
bits(bit) = logical(value);
byteout = sum(bits .* [1,2,4,8,16,32,64,128]);
end