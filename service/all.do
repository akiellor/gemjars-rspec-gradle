#!/bin/sh

set -e

redo-ifchange "package"
redo-ifchange "test"
