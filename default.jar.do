redo-ifchange "example/Calculator.class"

cd target/classes && zip -r ../$1 . >&2
