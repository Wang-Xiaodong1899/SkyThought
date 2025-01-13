#!/bin/bash

# data
cd $1
wget https://hf-mirror.com/datasets/NovaSky-AI/Sky-T1_data_17k/resolve/main/Sky-T1_data_17k.json

base_url="https://hf-mirror.com/Qwen/Qwen2.5-32B-Instruct/resolve/main/"

cd $1

GIT_LFS_SKIP_SMUDGE=1 git clone https://hf-mirror.com/Qwen/Qwen2.5-32B-Instruct

cd Qwen2.5-32B-Instruct

rm model-000*

start=1
end=17

for i in $(seq -f "%02g" $start $end); do
    file_name="model-000${i}-of-00017.safetensors"
    file_url="${base_url}${file_name}"

    echo "Downloading $file_name..."
    wget -O "$file_name" "$file_url"

    if [ $? -eq 0 ]; then
        echo "Downloaded $file_name successfully."
    else
        echo "Failed to download $file_name."
    fi
done

echo "Download complete."

