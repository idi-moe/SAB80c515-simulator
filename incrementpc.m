function [] = incrementpc()
%INCREMENTPC Increments the program counter (PC)
%   The PC is not addressable, and evry instruction increments it. Some
%   modify it as well, and some read it.
global pc
pc = pc + 1;
end

