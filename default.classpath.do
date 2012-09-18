redo-ifchange ".dependencies/ivysettings.xml"
redo-ifchange ".dependencies/ivy.xml"

CONF=$(basename $1)
java -jar .dependencies/ivy-2.3.0-rc1.jar -ivy .dependencies/ivy.xml -settings .dependencies/ivysettings.xml -cachepath $3 -confs ${CONF%.*} >&2
