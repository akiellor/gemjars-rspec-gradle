export PATH=$PATH:"./script"

SRC_DIR="src/main/java"
INPUT=$(find . -type f | grep $SRC_DIR | grep ".java$")

OUT_DIR="target/$(source-set $INPUT)"
CLASSES_DIR="$OUT_DIR/classes"
OUT_FILE=$(pwd)/$3

for d in $INPUT; do echo "${d%.java}.java-stamp"; done | xargs redo-ifchange

redo-ifchange "compile.classpath"

mkdir -p $CLASSES_DIR
touch needs-compile
sort -u needs-compile | xargs javac -sourcepath $SRC_DIR -classpath "$(cat compile.classpath):$CLASSES_DIR" -d $CLASSES_DIR >&2
rm -f needs-compile
cd $CLASSES_DIR && zip -r $OUT_FILE . > /dev/null
