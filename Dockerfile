FROM jupyter/tensorflow-notebook:cf57ef145dce

USER root

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  libasound2-dev libjack-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER $NB_UID

COPY requirements.txt /tmp/

RUN pip install --requirement /tmp/requirements.txt --quiet && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER
