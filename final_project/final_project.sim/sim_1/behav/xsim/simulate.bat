@echo off
REM ****************************************************************************
REM Vivado (TM) v2017.4.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Apr 18 17:07:57 +0100 2018
REM SW Build 2117270 on Tue Jan 30 15:32:00 MST 2018
REM
REM Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim tb_stream_mats_behav -key {Behavioral:sim_1:Functional:tb_stream_mats} -tclbatch tb_stream_mats.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
