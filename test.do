redo-ifchange "sample.jar"
redo-ifchange $(find "src/test/ruby" -type f)
read CP < ".classpath"
java -cp $CP:target/classes org.jruby.Main classpath:bin/rspec --color src/test/ruby >&2
