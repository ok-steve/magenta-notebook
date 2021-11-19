FROM jupyter/tensorflow-notebook:92ce0af9989f

USER root

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  build-essential libasound2-dev libjack-dev portaudio19-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER $NB_UID

COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt --quiet --no-deps && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER
