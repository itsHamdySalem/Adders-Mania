# Read post-synthesis netlist
read_verilog synthesized_netlist.v
read_verilog tb_CarryLookAheadAdder.v

# Compile and elaborate the design
compile_ultra

# Run simulation
simulate -post synth -duration 1000
