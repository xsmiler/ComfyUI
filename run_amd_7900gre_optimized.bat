@echo off
REM Optimized startup script for AMD Radeon RX 7900GRE GPU
REM This script includes best practices for AMD GPU performance in ComfyUI

REM Set AMD-specific environment variables
set HSA_OVERRIDE_GFX_VERSION=11.0.0
set HIP_VISIBLE_DEVICES=0
set OCL_SET_SVM_SIZE=262144
set TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL=1

REM Use the embedded Python environment
D:\softwares\miniconda3\envs\py12\python.exe -s main.py ^
    --listen ^
    --port 8188 ^
    --highvram ^
    --force-fp16 ^
    --force-channels-last ^
    --use-pytorch-cross-attention ^
    --disable-xformers ^
    --force-non-blocking ^
    --async-offload ^
    --disable-smart-memory ^
    --windows-standalone-build

pause