#!/bin/bash

clear
read -p "Nama Modul (ex: MyModul): " modul
if [ -z ${modul} ]; then
  modul='MyModul'
fi

modul=( $modul)
modul="${modul[@]^}"

echo "Menyiapkan modul ${modul}..."

FILE="src/Entity/${modul}.php"
echo "Menyiapkan berkas ${FILE}..."

if [ -f "$FILE" ]; then
	echo "$FILE modul ${modul} already exists.."
	echo "Proses telah dihentikan ..."
	echo "Gunakan perintah ./destroy-modul.sh untuk menghapus modul ${modul}.."
	exit;
fi

cmd="bin/console make:entity ${modul} -v"
php ${cmd} 

cmd="bin/console make:migration -v"
php ${cmd}

cmd="bin/console doctrine:migration:migrate -v"
php ${cmd}

cmd="bin/console make:crud ${modul} -v"
php ${cmd}



