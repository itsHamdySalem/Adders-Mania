# Read Verilog files
read_verilog CarrySelectAdder.v
read_verilog tb_CarrySelectAdder.v

# Compile and elaborate the design
compile_ultra

# Set constraints
set_clock_period 20
set_input_delay 1
set_load 10
set_output_delay 0.5
set_utilization 60
enable_all_library_cells

# Run synthesis
optimize_power
report_area
report_max_delay
report_max_slack
report_min_slack
report_power
