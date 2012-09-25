#!/bin/sh

set -e

export PATH=$PATH:$(pwd)/script

MAIN_JAR=$(target-jar main)

OUT=$(pwd)/$3

redo-ifchange $MAIN_JAR

WEBAPP="$(pwd)/target/webapp"
CLASSES=$WEBAPP/WEB-INF/classes

rm -Rf $WEBAPP

mkdir -p $CLASSES

unzip -o $MAIN_JAR -d $CLASSES >&2
cd $(source-dir main webapp) && cp -R . $WEBAPP >&2

cd $WEBAPP && zip -r $OUT . >&2

