#!/bin/bash

sudo apt install tmux

script_path=$(readlink -f "$0")
work_path=$(dirname "$script_path")
cp "$work_path"/tmux.conf ~/.tmux.conf