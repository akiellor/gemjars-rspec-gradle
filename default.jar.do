export PATH=$PATH:"./script"

SRC_DIR=$(source-dir main java)
INPUT=$(sources main java)

CLASSES_DIR=$(target-class-dir main)
OUT_FILE=$(pwd)/$3

for d in $INPUT; do echo "${d%.java}.java-stamp"; done | xargs redo-ifchange

redo-ifchange $(classpath main compile)

touch needs-compile
sort -u needs-compile | xargs javac -sourcepath $SRC_DIR -classpath "$(classpath main compile):$CLASSES_DIR" -d $CLASSES_DIR >&2
rm -f needs-compile
cd $CLASSES_DIR && zip -r $OUT_FILE . > /dev/null
