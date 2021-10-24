function [bitout] = readbit(byte,bit)
%READBIT reads a bit from a given byte (int), bit is index'd at 0
%   Detailed explanation goes here
bits = logical(bitand(byte,[1,2,4,8,16,32,64,128]));
bit=bit+1;
bitout = bits(bit);
end