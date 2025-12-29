#!/bin/bash
# Optimized startup script for NVIDIA V100 GPU on Linux
# This script includes best practices for V100 performance in ComfyUI

# Set NVIDIA-specific environment variables for V100 FP16 optimization
export CUDA_VISIBLE_DEVICES=0
export CUBLAS_WORKSPACE_CONFIG=:4096:8
export TORCH_CUDNN_V8_API_ENABLED=1
export NVIDIA_TF32_OVERRIDE=0  # Disable TF32 to prioritize FP16 performance
export TORCH_USE_CUDA_DSA=1  # Enable CUDA Device Side Assertions for debugging
export CUDA_LAUNCH_BLOCKING=0  # Enable asynchronous CUDA launches

# Use the Python environment with full FP16 optimization
python -s main.py \
    --listen \
    --port 8188 \
    --highvram \
    --fp16-unet \
    --fp16-vae \
    --fp16-text-enc \
    --force-fp16 \
    --use-pytorch-cross-attention \
    --cache-lru 16 \
    --force-channels-last \
    --async-offload \
    --cuda-malloc \
    --disable-smart-memory