#!/bin/sh

set -e

JAVA_FILE=${1%.java-stamp}.java
STALE="$(stale-path $(source-set $JAVA_FILE))"

redo-ifchange $JAVA_FILE
echo $JAVA_FILE >> $STALE
