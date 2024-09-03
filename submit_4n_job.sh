#!/bin/bash

salloc \
    --partition=pvc \
    --account=training-dawn-gpu \
    --nodes=4 \
    --gres=gpu:4 \
    --time=00:20:00 \
    --exclusive \
    "$@"   
