# SAB80c515-simulator (WIP for now)
A cycle-accurate emulator written in MATLAB for the Siemens version of the Intel 8051. The raison d'être of this emulator is to run the dumped ROMs from a number of 1980s ECUs used by Bosch, namely LH2.2, LH2.4, and some of the EZKs. By running the ROMs in an interactive manner one can better understand how they work and to test modifications to said ROMs.

## Why MATLAB? It's so ____
I know MATLAB, and want to make an emulator for practical purposes. It's not FOSS which is not ideal, costs money, which is not ideal, and is slow, which is not ideal. What it does have going for it is that it has a nice GUI/IDE, and I hope to make it so poking around in the processor as it is running is easy and intuitive. It's usually readable to people who have not taken CS classes before, and the overall project will not be too complex. If I knew what I was doing, I would not pick MATLAB.

## Topology
The ROM will be read into the data memory variable. The MCU then executes instructions as it goes, each instruction running micro-ops. The goal is to have no variables imported into the instruction function, because each micro-op will have them. In addition, all instructions address the micro-ops indexing at 0, the micro-ops add 1 internally, and access all of the indexing at 1 variables. Each instruction function can map to multiple instructions, because most are repetitive. Note the number of ADD instructions. As a result, each instruction function takes the opcode to be performed as the only argument, exits if the opcode is invalid, and then executes the particulars of that opcode.

## Documentation
Datasheets and specs will be put into the docs folder to assist anyone curious about the project or wishing to contribute.

## To contribute
If you want to contribute, make instructions that use micro-ops that exist already or make your own and document them when they don't exist. Use the kanban board under projects to pick instructions please. The other instructions and micro-ops are a model that would likely be good to follow.
Making the instructions is not too hard for the one-byte instructions, you can copy an existing one and modify it appropriately.
