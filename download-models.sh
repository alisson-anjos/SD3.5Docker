#!/bin/bash

download_file() {
    local dir=$1
    local file=$2
    local url=$3

    mkdir -p $dir
    if [ -f "$dir/$file" ]; then
        echo "File $dir/$file already exists, skipping download."
    else
        echo "Downloading $file..."
        wget -O "$dir/$file" --header="Authorization: Bearer ${HF_TOKEN}" "$url" --progress=bar:force:noscroll
    fi
}

if [[ -z "${HF_TOKEN}" ]] || [[ "${HF_TOKEN}" == "enter_your_huggingface_token_here" ]]
then
    echo "HF_TOKEN is not set, can not download Stable Diffusion 3.5 large because it is a gated repository."
else
    echo "HF_TOKEN is set, checking files..."

    # Download files
    download_file "/ComfyUI/models/unet" "sd3.5_large-Q8_0.gguf" "https://huggingface.co/city96/stable-diffusion-3.5-large-gguf/resolve/main/sd3.5_large-Q8_0.gguf?download=true"
    download_file "/ComfyUI/models/vae"  "sd3.5_vae.safetensors" "https://huggingface.co/stabilityai/stable-diffusion-3.5-large/resolve/main/vae/diffusion_pytorch_model.safetensors?download=true"
    download_file "/ComfyUI/models/clip" "clip_l.safetensors" "https://huggingface.co/stabilityai/stable-diffusion-3-medium/resolve/main/text_encoders/clip_l.safetensors?download=true"
    download_file "/ComfyUI/models/clip" "clip_g.safetensors" "https://huggingface.co/stabilityai/stable-diffusion-3-medium/resolve/main/text_encoders/clip_g.safetensors?download=true"
    download_file "/ComfyUI/models/clip" "t5-v1_1-xxl-encoder-Q8_0.gguf" "https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q8_0.gguf?download=true"
fi