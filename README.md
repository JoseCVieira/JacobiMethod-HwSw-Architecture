# Jacobi method
Implementation of Jacobi method in a co-processing architecture Hw/Sw using FPGA (Field Programmable Gate Array) ZYBO Zynq-7000 Development Board for Co-Project Hw/Sw course.

### Description:
###### From Wikipedia, the free encyclopedia

In numerical linear algebra, the **Jacobi method** (or **Jacobi iterative method**) is an algorithm for determining the solutions of a diagonally dominant system of linear equations. Each diagonal element is solved for, and an approximate value is plugged in. The process is then iterated until it converges. This algorithm is a stripped-down version of the Jacobi transformation method of matrix diagonalization. The method is named after **Carl Gustav Jacob Jacobi**.

### Implementation:
There are 4 projects in this repository:
- original - implements the method in C as a proof of concept
- project_ps_only - implements the method using the FPGA but only in software
- project_pl_ps - method  implemented in a co-processing architecture Hw/Sw without the use of DMA
- final_project - final version of the implementation, where the best results are obtained (Speedup~8.5)
