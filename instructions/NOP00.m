function [] = NOP00()
%NOP00 NOP, No Operation
%   Execution continuesat the following instruction. Other than the PC, no 
%   registersor flags are affected. Used for timing purposes.
%   (PC) <- (PC) + 1
% Oscillator period 12

incrementpc();
end

