#!/bin/bash

salloc \
    --partition=pvc \
    --account=support-gpu \
    --nodes=1 \
    --gres=gpu:1 \
    --time=00:05:00 \
    --exclusive \
    "$@"   
