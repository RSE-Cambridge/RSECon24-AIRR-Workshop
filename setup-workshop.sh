#!/bin/bash

SHARED_DIR=/rds/project/hpc/rds-hpc-training/rds-rsecon/shared
WORK_DIR=${HOME}/rds/hpc-work

# copy the contents of the workshop git repo (including jupyter notebook)
# to home directory
cp -r ${SHARED_DIR}/RSECon24-AIRR-Workshop/* ${HOME}/.

# copy the Intel LLM devkit (this may take some time)
rm -rf ${WORK_DIR}/llm-training
cp -r ${SHARED_DIR}/llm.devkit_cambridge ${WORK_DIR}/llm-training
