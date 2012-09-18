redo-ifchange "target/sample.jar"
redo-ifchange $(find "src/test/ruby" -type f)
redo-ifchange "compile.classpath"
java -cp $(cat compile.classpath):target/sample.jar org.jruby.Main classpath:bin/rspec --color src/test/ruby >&2
