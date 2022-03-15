FROM tensorflow/tensorflow:latest-gpu-jupyter
LABEL maintainer="Alessandro Delmonte <delmonte.ale92@gmail.com>"

# Uncomment if working behind the APHP proxy
# RUN echo -e "Acquire {http::proxy \"http://10.143.11.22:3128\"; https::proxy \"http://10.143.11.22:3128\";}" >> /etc/apt/apt.conf
# RUN cat /etc/apt/apt.conf
# RUN export {http_proxy,https_proxy,ftp_proxy}="http://10.143.11.22:3128/"

COPY requirements.txt /tf

WORKDIR /tf
# See above
# RUN pip install --default-timeout=1000 --proxy=http://10.143.11.22:3128 -U -r requirements.txt
RUN pip install -U -r requirements.txt

EXPOSE 8888
EXPOSE 6006

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --debug --notebook-dir=/tf --ip 0.0.0.0 --allow-root"]

# docker build --build-arg https_proxy=https://10.143.11.22:3128 -f Training.Dockerfile --rm --tag apmri-gpu-jupyter-training .

# docker run -u $(id -u) --gpus all -it -v /home/imag2/IMAG2_DL/APMRI-DNN:/tf --env HTTPS_PROXY=https://10.143.11.22:3128
# -p 8888:8888 -p 6006:6006 --rm --name tf apmri-gpu-jupyter-training:latest
