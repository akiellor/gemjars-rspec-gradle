export PATH=$PATH:./script

redo-ifchange "target/sample.jar"
redo-ifchange $(sources test ruby)
redo-ifchange $(classpath test runtime)
java -cp $(cat $(classpath test runtime)):target/sample.jar org.jruby.Main classpath:bin/rspec --color $(source-dir test ruby) >&2
