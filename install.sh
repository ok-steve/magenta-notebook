#!/bin/bash
sudo apt-get update
sudo apt-get install build-essential libasound2-dev libjack-dev portaudio19-dev -y
pip install -r requirements.txt --no-deps