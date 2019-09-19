FROM jupyter/tensorflow-notebook:822f02b8ce23

USER root

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  libasound2-dev libjack-dev sox && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER $NB_UID

COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt --quiet && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER
