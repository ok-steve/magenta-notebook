FROM jupyter/tensorflow-notebook:latest

USER root

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  build-essential libasound2-dev libjack-dev portaudio19-dev sox && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Create Python 3.7 environment and link it to Jupyter
ARG conda_env=python37
ARG py_ver=3.7

RUN mamba create --quiet --yes -p "${CONDA_DIR}/envs/${conda_env}" python=${py_ver} ipython ipykernel && \
  mamba clean --all -f -y

# create Python kernel and link it to jupyter
RUN "${CONDA_DIR}/envs/${conda_env}/bin/python" -m ipykernel install --user --name="${conda_env}" && \
  fix-permissions "${CONDA_DIR}" && \
  fix-permissions "/home/${NB_USER}"

# Install dependencies
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

RUN "${CONDA_DIR}/envs/${conda_env}/bin/pip" install --quiet --no-cache-dir -r /tmp/requirements.txt

# Set Python 3.7 as default environment
RUN echo "conda activate ${conda_env}" >> "${HOME}/.bashrc"