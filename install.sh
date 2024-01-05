#!/bin/bash

mkdir -p ~/.config

ln -sf ${PWD}/user/.* $HOME
ln -sf ${PWD}/config/* $HOME/.config
