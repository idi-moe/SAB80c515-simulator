function [] = incrementpc()
%INCREMENTPC Increments the program counter (PC)
%   The PC is not addressable, and evry instruction increments it. Some
%   modify it as well, and some read it.
global pc
pc = mod(pc + 1,65536); %it probably does this
end

