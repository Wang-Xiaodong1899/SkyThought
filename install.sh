conda create -n llamafactory python=3.11

conda activate llamafactory

git clone --depth 1 https://github.com/Wang-Xiaodong1899/SkyThought.git
cd SkyThought/skythought/train/LLaMA-Factory

pip install -e ".[torch,metrics]"
