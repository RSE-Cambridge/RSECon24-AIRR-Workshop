#!/bin/bash

#SBATCH --partition=pvc
#SBATCH --account=training-dawn-gpu
#SBATCH --nodes=1
#SBATCH --gres=gpu:4
#SBATCH --time=00:20:00
#SBATCH --exclusive
#SBATCH --output show_gpu.out

# Setup environment for Intel PyTorch
module load intelpython-conda
conda activate pytorch-gpu

# One liner to print the number and type of devices
python -c 'import torch; import intel_extension_for_pytorch as ipex; print(f"Number of GPUs: {torch.xpu.device_count()}"); print(f"Device 0 is {torch.xpu.get_device_name(0)}")'

echo "JOB COMPLETE"
