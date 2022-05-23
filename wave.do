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
add wave -noupdate -divider {Dummy Register}
add wave -noupdate /rpn_tb/DUT/DUMMY_REGISTER/enable
add wave -noupdate /rpn_tb/DUT/DUMMY_REGISTER/in
add wave -noupdate /rpn_tb/DUT/DUMMY_REGISTER/out
add wave -noupdate /rpn_tb/DUT/DUMMY_REGISTER/mux_into_reg
add wave -noupdate -divider {Stack Pointer Register}
add wave -noupdate /rpn_tb/DUT/STACK_POINTER/enable
add wave -noupdate /rpn_tb/DUT/STACK_POINTER/in
add wave -noupdate /rpn_tb/DUT/STACK_POINTER/out
add wave -noupdate /rpn_tb/DUT/STACK_POINTER/mux_into_reg
add wave -noupdate -divider STACK
add wave -noupdate /rpn_tb/DUT/STACK/write
add wave -noupdate /rpn_tb/DUT/STACK/read_address
add wave -noupdate /rpn_tb/DUT/STACK/write_address
add wave -noupdate /rpn_tb/DUT/STACK/din
add wave -noupdate /rpn_tb/DUT/STACK/dout
add wave -noupdate -divider MEMORY
add wave -noupdate {/rpn_tb/DUT/STACK/mem[16]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[15]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[14]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[13]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[12]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[11]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[10]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[9]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[8]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[7]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[6]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[5]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[4]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[3]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[2]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[1]}
add wave -noupdate {/rpn_tb/DUT/STACK/mem[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24 ps} 0}
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
