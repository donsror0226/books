#!/bin/bash
#
# This will run Mysql and delete (drop) the table media.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/bin/books_scripts/                          #
# File Name : z_tb_delete_media_mysql.sh                            #
# Rev. Date : 04/14/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Delete table media"
echo -e "----------------------\n"

mysql -u dondb -pdps0226db < ./sql_commands/tb_delete_media.sql
#ERRORCODE=$?
#echo "1ERRORCODE = $ERRORCODE"


echo -e "\nDelete migration create_media "
echo -e "--"
ls /home/don/workspace/books/db/migrate/*_media.* 2>/dev/null
ERRORCODE=$?
#echo "2ERRORCODE = $ERRORCODE"
if [ $ERRORCODE -eq 2 ]; then
	echo -e "\t****************************"
	echo -e "\tNo migration file for media."
	echo -e "\t****************************"
fi
echo -e "--"


rm /home/don/workspace/books/db/migrate/*_media.* 2>/dev/null
ERRORCODE=$?
#echo "3ERRORCODE = $ERRORCODE"
if [ $ERRORCODE = 1 ]; then
	echo -e "************************"
	echo -e "Table all ready deleted."
	echo -e "************************"
fi

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal. Copyed form                        #
#            :        : tb_delete_books_mysql.sh.                   #
# ----------------------------------------------------------------- #
# 04/14/2020 : 0.0.2  : Add stderr (2) to rm command.               #
#            :        : Add errorcode test to rm command.           #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
