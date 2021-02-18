#!/bin/bash
source /opt/miniconda/etc/profile.d/conda.sh
conda activate base
jupyter notebook --no-browser --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''
