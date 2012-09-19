export PATH=$PATH:./script
redo-ifchange ".dependencies/ivysettings.xml"
redo-ifchange ".dependencies/ivy.xml"

BASE=$(basename $1)
CONF=${BASE%.*}
java -jar .dependencies/ivy-2.3.0-rc1.jar -ivy .dependencies/ivy.xml -settings .dependencies/ivysettings.xml -cachepath $3 -confs $CONF >&2

OUT=$(paste -d'\0' $3 <(echo ":$(target-class-dir ${CONF%.*})"))

echo $OUT > $3
