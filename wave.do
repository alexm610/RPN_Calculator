onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {TOP LEVEL}
add wave -noupdate /rpn_tb/CLOCK_50
add wave -noupdate {/rpn_tb/KEY[1]}
add wave -noupdate {/rpn_tb/KEY[0]}
add wave -noupdate -divider INTERNAL
add wave -noupdate /rpn_tb/DUT/write
add wave -noupdate /rpn_tb/DUT/current_state
add wave -noupdate /rpn_tb/DUT/tri_enable
add wave -noupdate -divider SWITCHES
add wave -noupdate /rpn_tb/DUT/SW
add wave -noupdate -divider LED
add wave -noupdate /rpn_tb/DUT/LEDR
add wave -noupdate -divider STACK
add wave -noupdate -divider {SP Register}
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/clk
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/enable
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/in
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/out
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/mux_into_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {320 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 325
configure wave -valuecolwidth 139
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {344 ps}
