#!/bin/sh

set -e

modules | xargs -I _ redo-ifchange _/all
