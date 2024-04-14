transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Ryan/Dropbox/Clemson Portfolio/VHDL Code/Multiplexer + 7 Segment Display/Lab1/Lab1d.vhdl}
vcom -93 -work work {C:/Users/Ryan/Dropbox/Clemson Portfolio/VHDL Code/Multiplexer + 7 Segment Display/Lab1/Lab1c.vhdl}
vcom -93 -work work {C:/Users/Ryan/Dropbox/Clemson Portfolio/VHDL Code/Multiplexer + 7 Segment Display/Lab1/Lab1b.vhdl}

vcom -93 -work work {C:/Users/Ryan/Dropbox/Clemson Portfolio/VHDL Code/Multiplexer + 7 Segment Display/Lab1/simulation/modelsim/Lab1d.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  lab1d_vhd_tst

add wave *
view structure
view signals
run -all
