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
bash ../intel-extension-for-deepspeed/examples/run3.6b.sh

