SRC_DIR="src/main/java"
OUT_DIR="target"
CLASSES_DIR="$OUT_DIR/classes"
INPUT=$(find . -type f | grep "src/main/java" | grep ".java$")
OUT_FILE=$(pwd)/$3
echo $INPUT | xargs redo-ifchange
redo-ifchange "compile.classpath"

mkdir -p $CLASSES_DIR
javac -verbose -sourcepath $SRC_DIR -classpath "$(cat compile.classpath):$CLASSES_DIR" -d $CLASSES_DIR $(find $SRC_DIR -type f) >&2
cd $CLASSES_DIR && zip -r $OUT_FILE . >&2
