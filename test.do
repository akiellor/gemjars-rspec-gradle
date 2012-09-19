#!/bin/sh

set -e

export PATH=$PATH:$(pwd)/script

redo-ifchange $(target-jar main)
redo-ifchange $(sources test ruby)
redo-ifchange $(classpath test runtime)

java -server -Xms16m -Xmx32m -cp $(cat $(classpath test runtime)):$(target-jar main) org.jruby.Main classpath:bin/rspec --color $(source-dir test ruby) >&2
