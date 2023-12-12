# Constraints for CarryLookAheadAdder Module

# Set input delays to 1ns
set_input_delay 10 [get_ports {A B Cin}]

# Set load to 10 for output F
set_load 10 [get_ports *]

# Set output load to 0.5ns for output F
set_output_delay 0.5 [get_ports {F Cout}]

# Set utilization to 60%
set_utilization 60

# Enable usage of all library cells
set_dont_use false [get_lib_cells *]

# Report constraints summary
report_timing_summary
