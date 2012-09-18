SRC_DIR="src/main/java"
OUT_DIR="target"
CLASSES_DIR="$OUT_DIR/classes"
INPUT=$(find . -type f | grep "src/main/java" | grep ".java$")
OUT_FILE=$(pwd)/$3

for d in $INPUT; do echo "${d%.java}.java-stamp"; done | xargs redo-ifchange

redo-ifchange "compile.classpath"

mkdir -p $CLASSES_DIR
touch needs-compile
sort -u needs-compile | xargs javac -sourcepath $SRC_DIR -classpath "$(cat compile.classpath):$CLASSES_DIR" -d $CLASSES_DIR >&2
rm -f needs-compile
cd $CLASSES_DIR && zip -r $OUT_FILE . > /dev/null
