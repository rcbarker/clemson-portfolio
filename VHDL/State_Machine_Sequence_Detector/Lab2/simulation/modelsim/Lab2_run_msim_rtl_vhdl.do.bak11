transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/altera/14.1/Lab2/Lab2c.vhdl}

vcom -93 -work work {F:/altera/14.1/Lab2/simulation/modelsim/Lab2c.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  Lab2c_vhd_tst

add wave *
view structure
view signals
run -all
