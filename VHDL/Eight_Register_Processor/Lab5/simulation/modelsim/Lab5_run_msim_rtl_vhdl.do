transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_Reg.vhdl}
vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_IR.vhdl}
vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_Mux.vhdl}
vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_AddSub.vhdl}
vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_Ctrl.vhdl}
vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_Decoder.vhdl}
vcom -93 -work work {/users/rcbarke/ECE327/Lab5/Lab5_Processor.vhdl}

vcom -93 -work work {/users/rcbarke/ECE327/Lab5/simulation/modelsim/Lab5_Processor.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  Lab5_Processor_vhd_tst

add wave *
view structure
view signals
run -all
