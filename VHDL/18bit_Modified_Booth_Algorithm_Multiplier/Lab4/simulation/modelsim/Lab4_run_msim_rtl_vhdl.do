transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/altera/14.1/Lab4/Lab4.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_RegA.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_RegB.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_RegC.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_RegD.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_Ctrl.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_Adder.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_RegA_Mux.vhdl}
vcom -93 -work work {F:/altera/14.1/Lab4/Lab4_Adder_Mux.vhdl}

vcom -93 -work work {F:/altera/14.1/Lab4/simulation/modelsim/Lab4_5.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  Lab4_5_vhd_tst

add wave *
view structure
view signals
run -all
