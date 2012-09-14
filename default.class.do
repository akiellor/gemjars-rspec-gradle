javac -verbose -sourcepath "src/main/java" -classpath "target/classes" -d "target/classes" "src/main/java/$(echo $1 | cut -d\. -f1).java" >&2
