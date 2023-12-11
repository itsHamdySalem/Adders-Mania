# Adders-Mania

## Compile and Run the Carry Look-Ahead Adder

1. **Run Synthesis:**
   - Execute the following command to run synthesis:

   ```bash
   dc_shell -f src/CarryLookAheadAdder/synthesisScript.tcl

2. **Run Post Synthesis Simulation:**
   - Execute the following command to run post synthesis simulation:

   ```bash
   vsim -c -do src/CarryLookAheadAdder/postSynthesis.tcl
