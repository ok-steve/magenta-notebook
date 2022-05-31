# magenta-notebook

Extending the [Jupyter Tensorflow stack](https://github.com/jupyter/docker-stacks) with Magenta.

## Getting started

1. Download the repository.
2. Build the image: `docker build -t magenta-notebook .`
3. Run the image: ``docker run --rm -it -p 8888:8888 -v `pwd`:/home/jovyan/work magenta-notebook``
4. Open `localhost:8888` in a browser.

## Example notebooks

- https://github.com/magenta/magenta-demos/tree/main/colab-notebooks
- https://github.com/magenta/magenta-demos/tree/main/jupyter-notebooks
- https://github.com/magenta/ddsp/tree/main/ddsp/colab/demos
- https://goo.gl/magenta/onsets-frames-colab
- https://colab.research.google.com/notebooks/magenta/hello_magenta/hello_magenta.ipynb

# NSynth

- [Source audio](https://storage.googleapis.com/open-nsynth-super/audio/onss_source_audio.tar.gz)
