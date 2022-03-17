#!/bin/bash

script_path=$(readlink -f "$0")
work_path=$(dirname "$script_path")
cp "$work_path"/../gitconfig ~/.gitconfig
