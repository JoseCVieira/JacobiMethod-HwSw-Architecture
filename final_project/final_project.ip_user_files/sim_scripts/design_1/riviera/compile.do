vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_1
vlib riviera/axi_vip_v1_1_1
vlib riviera/processing_system7_vip_v1_0_3
vlib riviera/blk_mem_gen_v8_4_1
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_1
vlib riviera/lib_fifo_v1_0_10
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_17
vlib riviera/axi_sg_v4_1_8
vlib riviera/axi_dma_v7_1_16
vlib riviera/xlconstant_v1_1_3
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_data_fifo_v2_1_14
vlib riviera/axi_register_slice_v2_1_15
vlib riviera/axi_protocol_converter_v2_1_15

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_1 riviera/axi_protocol_checker_v2_0_1
vmap axi_vip_v1_1_1 riviera/axi_vip_v1_1_1
vmap processing_system7_vip_v1_0_3 riviera/processing_system7_vip_v1_0_3
vmap blk_mem_gen_v8_4_1 riviera/blk_mem_gen_v8_4_1
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_1 riviera/fifo_generator_v13_2_1
vmap lib_fifo_v1_0_10 riviera/lib_fifo_v1_0_10
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_17 riviera/axi_datamover_v5_1_17
vmap axi_sg_v4_1_8 riviera/axi_sg_v4_1_8
vmap axi_dma_v7_1_16 riviera/axi_dma_v7_1_16
vmap xlconstant_v1_1_3 riviera/xlconstant_v1_1_3
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_14 riviera/axi_data_fifo_v2_1_14
vmap axi_register_slice_v2_1_15 riviera/axi_register_slice_v2_1_15
vmap axi_protocol_converter_v2_1_15 riviera/axi_protocol_converter_v2_1_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ip/design_1_my_axis_int_matp_cnt_0_1/src/blk_mem_gen_0/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_my_axis_int_matp_cnt_0_1/src/blk_mem_gen_0/sim/blk_mem_gen_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ipshared/02f0/src/vect_prod_dpv.vhd" \
"../../../bd/design_1/ipshared/02f0/src/my_axis_int_matp_cnt.vhd" \
"../../../bd/design_1/ip/design_1_my_axis_int_matp_cnt_0_1/sim/design_1_my_axis_int_matp_cnt_0_1.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_1 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_10 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/f10a/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_17 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/71f3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_8 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/5f94/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_16 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/bf8c/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_dma_0_0/sim/design_1_axi_dma_0_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/786b/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_10/sim/bd_afc3_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_17/sim/bd_afc3_s01a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/92d2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_20/sim/bd_afc3_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/258c/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_26/sim/bd_afc3_m00e_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_21/sim/bd_afc3_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_22/sim/bd_afc3_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_23/sim/bd_afc3_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_24/sim/bd_afc3_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_25/sim/bd_afc3_m00bn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_18/sim/bd_afc3_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_19/sim/bd_afc3_srn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/8ad6/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_14/sim/bd_afc3_s01mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/0f5f/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_15/sim/bd_afc3_s01tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/925a/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_16/sim/bd_afc3_s01sic_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_11/sim/bd_afc3_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_12/sim/bd_afc3_swn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_13/sim/bd_afc3_sbn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_7/sim/bd_afc3_s00mmu_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_8/sim/bd_afc3_s00tr_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_9/sim/bd_afc3_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1b0c/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/sim/bd_afc3_arsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/sim/bd_afc3_rsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_4/sim/bd_afc3_awsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_5/sim/bd_afc3_wsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_6/sim/bd_afc3_bsw_0.sv" \

vlog -work xlconstant_v1_1_3  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/sim/bd_afc3_one_0.v" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/sim/bd_afc3_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/sim/bd_afc3.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_smc_0/sim/design_1_axi_smc_0.vhd" \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_14  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_15  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_15  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+../../../../final_project.srcs/sources_1/bd/design_1/ipshared/e2dd/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

