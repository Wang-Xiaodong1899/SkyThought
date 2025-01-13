conda create -n llamafactory python=3.11

conda activate llamafactory

cd SkyThought/skythought/train/LLaMA-Factory

pip install -e ".[torch,metrics]"
