# HyRRT Algorithm

Simulation M-files for examples in CDC'22 paper: Rapid-exploring Random Tree Algorithm for Hybrid Systems.

Author: Nan Wang Revision: 0.0.0.1 Date: 04/03/2022 23:39:44

https://github.com/HybridSystemsLab/hybridRRT

Requirements: 

* MatLab (Developed in R2021a) 
* Install Hybrid Equations Toolbox v2.04 by downloading it from https://www.mathworks.com/matlabcentral/fileexchange/41372-hybrid-equations-toolbox-v2-04?s_tid=srchtitle
* Install tree data structure as a MATLAB class by downloading it from https://www.mathworks.com/matlabcentral/fileexchange/35623-tree-data-structure-as-a-matlab-class or https://github.com/tinevez/matlab-tree

Both Hybrid Equations Toolbox and tree data structure as a MATLAB class have been included in this repository.

Content

* Hybrid Equations Toolbox
* Tree data structure as a MATLAB class
* Hybrid RRT Algorithm Example and its supplemental function files

---

Motivational Examples

This repository includes the two simulations in CDC'22 submission -- actuated bouncing ball example and biped example. The hybrid model data (C, f, D, g) of each example, as well as their initialization, sampling, and postprocess functions , are placed in the "bouncingball" folder and "biped" folder seperately. The switch between two examples is controled by adding files in different folders in line 7-12 of rrt.m file. The settings of those simulations are the same as those given in CDC'22 submission. 

By running 'rrt.m',

* it will create the motion plan 'motionplan', with time 't' in the first row, number of jumps 'j' in the second row, following the states and inputs.
* it will create a figure showing that the generated motion plan connects the initial and final state sets. 







