export PATH=$PATH:./script

redo-ifchange $(classpath instrumented compile)
redo-ifchange $(target-jar main)


mkdir -p "target/coverage/classes"

unzip -o $(target-jar main) -d "target/coverage/classes" >&2

java -cp $(cat $(classpath instrumented compile)) net.sourceforge.cobertura.instrument.Main --datafile "target/coverage/cobertura.ser" "target/coverage/classes/" >&2

java -cp $(cat $(classpath instrumented compile)):target/coverage/classes -Dnet.sourceforge.cobertura.datafile=target/coverage/cobertura.ser org.jruby.Main classpath:bin/rspec src/test/ruby >&2

java -cp $(cat $(classpath instrumented compile)) net.sourceforge.cobertura.reporting.Main --datafile "target/coverage/cobertura.ser" --destination "target/coverage/report/" "src/main/java" >&2

