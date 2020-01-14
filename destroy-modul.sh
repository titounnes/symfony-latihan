#!/bin/bash

clear
read -p "Nama Modul (ex: MyModul): " modul
if [ -z ${modul} ]; then
  modul='MyModul'
fi

modul=( $modul)
modul="${modul[@]^}"

echo "Menghapus  modul ${modul}..."

FILE="src/Entity/${modul}.php"
rm ${FILE} -fv

FILE="src/Repository/${modul}Repository.php"
rm ${FILE} -fv

FILE="src/Controller/${modul}Controller.php"
rm ${FILE} -fv

FILE="src/Form/${modul}Type.php"
rm ${FILE} -fv

FILE="templates/${modul~}/"
rm ${FILE} -Rfv
echo "Modul telah dihapus..."
echo "JIka modul berelasi dengan modul lain silahkan periksa modul terkail pada bagian direktory src/Entity/ dan src/Migration/ agar tidak terjadi error"
 
