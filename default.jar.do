#!/bin/sh

set -e

export PATH=$PATH:"$(pwd)/script"

FILENAME=$(basename $1)

SOURCE_SET=${FILENAME%.*}

SRC_DIR=$(source-dir $SOURCE_SET java)
INPUT=$(sources $SOURCE_SET java)

CLASSES_DIR=$(target-class-dir $SOURCE_SET)
OUT_FILE=$(pwd)/$3

for d in $INPUT; do echo "${d%.java}.java-stamp"; done | xargs redo-ifchange

redo-ifchange $(classpath main compile)

touch needs-compile
sort -u needs-compile | xargs javac -sourcepath $SRC_DIR -classpath "$(classpath $SOURCE_SET compile)" -d $CLASSES_DIR >&2
rm -f needs-compile
cd $CLASSES_DIR && zip -r $OUT_FILE . > /dev/null
