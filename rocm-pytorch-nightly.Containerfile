FROM rocm/pytorch-nightly:latest

RUN conda run -n py_3.10 pip3 install --no-cache-dir sageattention
ADD https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui
RUN sed 's/^torch/#torch/' /opt/comfyui/requirements.txt > /tmp/requirements-alter.txt
RUN conda run -n py_3.10 pip3 install --no-cache-dir -r /tmp/requirements-alter.txt
RUN conda run -n py_3.10 pip3 install --no-cache-dir --extra-index-url https://download.pytorch.org/whl/nightly/rocm6.4 torchsde torchaudio

ADD https://github.com/pollockjj/ComfyUI-MultiGPU.git /opt/comfyui/custom_nodes/ComfyUI-MultiGPU

ADD https://github.com/chengzeyi/Comfy-WaveSpeed.git /opt/comfyui/custom_nodes/Comfy-WaveSpeed

ADD https://github.com/city96/ComfyUI-GGUF.git /opt/comfyui/custom_nodes/ComfyUI-GGUF
RUN conda run -n py_3.10 pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-GGUF/requirements.txt

ADD https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git /opt/comfyui/custom_nodes/ComfyUI-VideoHelperSuite
RUN conda run -n py_3.10 pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-VideoHelperSuite/requirements.txt

ADD https://github.com/kijai/ComfyUI-WanVideoWrapper.git /opt/comfyui/custom_nodes/ComfyUI-WanVideoWrapper
RUN conda run -n py_3.10 pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-WanVideoWrapper/requirements.txt

EXPOSE 8188
