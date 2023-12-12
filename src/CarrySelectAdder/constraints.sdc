# Constraints for CarrySelectAdder Module

# Set input delays to 1ns
set_input_delay 1 -clock [get_clocks *] [get_ports {A B Cin}]

# Set load to 10 for output F
set_load 10 [get_ports F]

# Set output load to 0.5ns for output F
set_output_delay 0.5 [get_ports F]

# Set utilization to 60%
set_utilization 60

# Enable usage of all library cells
set_dont_use false [get_lib_cells *]

# Report constraints summary
report_timing_summary
