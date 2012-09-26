#!/bin/sh

export PATH=$PATH:$(pwd)/script

set -e

redo-ifchange $(target-jar main)
