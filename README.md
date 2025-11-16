# FOUR-STATE-CONTROLLABLE-MEMORY-ELEMENT
Project Overview:
This project implements a complete SystemVerilog-based verification environment for a JK Flip-Flop using a structured approach similar to UVM. The testbench includes generator, driver, monitor, scoreboard, reference model, interface, DUT, and environment blocks. The objective is to verify the DUT output for all possible combinations of J and K using constrained random verification and self-checking mechanisms.

File Structure:

jk_flipflop.v – Design Under Test (JK Flip-Flop)

jk_if.sv – Interface for connecting DUT and TB

jk_generator.sv – Generates random stimulus

jk_driver.sv – Drives J and K to the interface

jk_monitor.sv – Reads inputs and outputs from DUT

jk_reference.sv – Computes expected output behavior

jk_scoreboard.sv – Compares expected and actual outputs

jk_env.sv – Connects all TB components

testbench.sv – Top-level testbench file

Methodology:

Stimulus Generation:
Random values of J and K are generated using a constrained random class.

Driving Stage:
Driver receives transactions from the generator and drives them into the DUT through the interface.

DUT Execution:
The JK Flip-Flop updates its Q output based on the following truth table:
J=0 K=0 → No Change
J=0 K=1 → Reset (Q = 0)
J=1 K=0 → Set (Q = 1)
J=1 K=1 → Toggle (Q flips)

Monitoring:
The monitor samples J, K, and Q at every clock cycle and forwards them to the scoreboard.

Reference Model:
A behavioral model is implemented to calculate the expected Q output using the same JK logic.

Scoreboarding:
The scoreboard compares expected output from reference model with actual DUT output.
Mismatches are counted and displayed as errors.

Environment:
Connects generator, driver, monitor, and scoreboard and synchronizes the entire verification flow.

Features:
• Constrained random stimulus generation
• Self-checking testbench
• Modular and reusable verification components
• Reference model-based checking
• Scoreboard for automated validation
• Clock-driven signal sampling

How to Run:
Compile and simulate using any SV simulator (QuestaSim, VCS, etc.)

vlog *.sv
vsim testbench
run -all

The output will display pass/fail logs and mismatch count.

Expected Output:
• All signals of J, K, Q
• Display of expected vs actual values
• PASS messages for correct behavior
• Mismatch count (should be 0 ideally)

Conclusion:
This project demonstrates a complete SystemVerilog verification environment for validating the functional behavior of a JK Flip-Flop. The testbench is modular, reusable, scalable, and fully self-checking, making it suitable for academic as well as industrial verification learning.
CONTRIBUTORS:
• Developer: K.HAREESH
• Mentor / Guide: Pavan Kumar E
• Institution: [KALASALINGAM ACCADEMY OF RESEARCH AND EDUCATION] 
• Year: 2025

LICENSE: This project is open-source and developed for academic and research purposes. You may use, modify, and enhance it with proper credit.
