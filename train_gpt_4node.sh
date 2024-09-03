#!/bin/bash

SHARED_DIR=/rds/project/hpc/rds-hpc-training/rds-rsecon/shared
WORK_DIR=${HOME}/rds/hpc-work
LLM_TRAINING_DIR=${WORK_DIR}/llm-training

# Set up conda (this module can not be unloaded)
module load intelpython-conda/2024.0.1.3

# Activate the shared conda environment
conda activate $SHARED_DIR/conda-env

# This directory should be created by setup-workshop.sh
cd $LLM_TRAINING_DIR

# Set up Intel dependencies and set ZE_AFFINITY_MASK
source setenv_cambridge.sh

# Generate hostfiles
cd ${LLM_TRAINING_DIR}/intel-extension-for-deepspeed/examples
source generate_hostfile_cambridge.sh

# Run training
cd ${LLM_TRAINING_DIR}/Megatron-DeepSpeed
export WORLD_SIZE=32 # 4 nodes * 8 tiles
export PP=4 # pipeline parallelism
export ZERO_STAGE=1 # set to stage 1 only to avoid communication overhead
export TP=8 # number of tensor parallelism shards
export GRAD_ACC_STEPS=8
bash ../intel-extension-for-deepspeed/examples/run20b.sh
