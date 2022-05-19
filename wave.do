onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /rpn_tb/CLOCK_50
add wave -noupdate {/rpn_tb/KEY[1]}
add wave -noupdate {/rpn_tb/KEY[0]}
add wave -noupdate -divider INTERNAL
add wave -noupdate /rpn_tb/data_IN
add wave -noupdate /rpn_tb/data_OUT
add wave -noupdate /rpn_tb/error
add wave -noupdate -divider SWITCHES
add wave -noupdate {/rpn_tb/SW[9]}
add wave -noupdate {/rpn_tb/SW[8]}
add wave -noupdate {/rpn_tb/SW[7]}
add wave -noupdate {/rpn_tb/SW[6]}
add wave -noupdate {/rpn_tb/SW[5]}
add wave -noupdate {/rpn_tb/SW[4]}
add wave -noupdate {/rpn_tb/SW[3]}
add wave -noupdate {/rpn_tb/SW[2]}
add wave -noupdate {/rpn_tb/SW[1]}
add wave -noupdate {/rpn_tb/SW[0]}
add wave -noupdate -divider LED
add wave -noupdate {/rpn_tb/LEDR[9]}
add wave -noupdate {/rpn_tb/LEDR[8]}
add wave -noupdate {/rpn_tb/LEDR[7]}
add wave -noupdate {/rpn_tb/LEDR[6]}
add wave -noupdate {/rpn_tb/LEDR[5]}
add wave -noupdate {/rpn_tb/LEDR[4]}
add wave -noupdate {/rpn_tb/LEDR[3]}
add wave -noupdate {/rpn_tb/LEDR[2]}
add wave -noupdate {/rpn_tb/LEDR[1]}
add wave -noupdate {/rpn_tb/LEDR[0]}
add wave -noupdate -divider STACK
add wave -noupdate {/rpn_tb/DUT/STACK/mem[3]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[2]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[1]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[0]}
add wave -noupdate -divider {SP Register}
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/clk
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/enable
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/in
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/out
add wave -noupdate /rpn_tb/DUT/STACK_POINTER_REGISTER/mux_into_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 282
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
WaveRestoreZoom {94 ps} {139 ps}
