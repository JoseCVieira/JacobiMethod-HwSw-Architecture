onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xbip_utils_v3_0_8 -L axi_utils_v2_0_4 -L xbip_pipe_v3_0_4 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_4 -L xbip_dsp48_multadd_v3_0_4 -L xbip_bram18k_v3_0_4 -L mult_gen_v12_0_13 -L floating_point_v7_1_5 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.floating_point_acc_0

do {wave.do}

view wave
view structure
view signals

do {floating_point_acc_0.udo}

run -all

quit -force
