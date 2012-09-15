redo-ifchange ".dependencies/ivysettings.xml"
redo-ifchange ".dependencies/ivy.xml"
java -jar .dependencies/ivy-2.3.0-rc1.jar -ivy .dependencies/ivy.xml -settings .dependencies/ivysettings.xml -cachepath $3 >&2
