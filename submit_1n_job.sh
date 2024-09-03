#!/bin/bash

salloc \
    --partition=pvc \
    --account=support-gpu \
    --nodes=1 \
    --gres=gpu:4 \
    --time=00:20:00 \
    --exclusive \
    "$@"   
