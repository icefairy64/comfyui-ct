FROM nvcr.io/nvidia/pytorch:25.03-py3

RUN mkdir /opt/builds

ADD https://github.com/thu-ml/SageAttention.git /opt/builds/SageAttention
RUN pip3 install /opt/builds/SageAttention

#ADD https://github.com/aredden/torch-cublas-hgemm.git /opt/builds/torch-cublas-hgemm
#RUN pip3 install /opt/builds/torch-cublas-hgemm

ADD https://github.com/comfyanonymous/ComfyUI /opt/comfyui
RUN sed 's/^torch/#torch/' /opt/comfyui/requirements.txt > /opt/comfyui/requirements-alter.txt
RUN pip3 install --no-cache-dir -r /opt/comfyui/requirements-alter.txt
RUN pip3 install --no-cache-dir --extra-index-url https://download.pytorch.org/whl/cu128 torchsde

ADD https://github.com/pollockjj/ComfyUI-MultiGPU.git /opt/comfyui/custom_nodes/ComfyUI-MultiGPU

ADD https://github.com/chengzeyi/Comfy-WaveSpeed.git /opt/comfyui/custom_nodes/Comfy-WaveSpeed

ADD https://github.com/kijai/ComfyUI-GIMM-VFI.git /opt/comfyui/custom_nodes/ComfyUI-GIMM-VFI
RUN pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-GIMM-VFI/requirements.txt

ADD https://github.com/city96/ComfyUI-GGUF.git /opt/comfyui/custom_nodes/ComfyUI-GGUF
RUN pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-GGUF/requirements.txt

ADD https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git /opt/comfyui/custom_nodes/ComfyUI-VideoHelperSuite
RUN pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-VideoHelperSuite/requirements.txt

ADD https://github.com/kijai/ComfyUI-WanVideoWrapper.git /opt/comfyui/custom_nodes/ComfyUI-WanVideoWrapper
RUN pip3 install --no-cache-dir -r /opt/comfyui/custom_nodes/ComfyUI-WanVideoWrapper/requirements.txt

EXPOSE 8188
