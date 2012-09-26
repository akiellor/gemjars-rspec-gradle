export PATH=$PATH:./script
redo-ifchange "$(project-root)/.project/ivysettings.xml"
redo-ifchange ".dependencies/ivy.xml"

BASE=$(basename $1)
CONF=${BASE%.*}
java -server -Xms8m -Xmx16m -jar $(project-root)/.project/ivy-2.3.0-rc1.jar -settings $(project-root)/.project/ivysettings.xml -ivy ".dependencies/ivy.xml" -cachepath $3 -confs $CONF >&2

OUT=$(paste -d'\0' $3 <(echo ":$(target-class-dir ${CONF%.*})"))

echo $OUT > $3
