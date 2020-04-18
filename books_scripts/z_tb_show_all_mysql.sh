#!/bin/bash
#
# This will run Mysql and delete (drop) all 4 tables.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_delete_all_mysql.sh                              #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.3                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Show all tables"
echo -e "-------------------\n"

mysql -u dondb -pdps0226db < ./sql_commands/tb_show_all.sql
#ERRORCODE=$?
#echo "1ERRORCODE = $ERRORCODE"


#echo -e "\nDelete all migration create tables "
#echo -e "--"
#ls /home/don/workspace/books/db/migrate/*_create*.* 2>/dev/null
#ERRORCODE=$?
##echo "2ERRORCODE = $ERRORCODE"
#if [ $ERRORCODE -eq 2 ]; theb
#	echo -e "\t*******************"
#	echo -e "\tNo migration files."
#	echo -e "\t*******************"
#fi
#echo -e "--"


#rm /home/don/workspace/books/db/migrate/*_create*.* 2>/dev/null
#ERRORCODE=$?
##echo "3ERRORCODE = $ERRORCODE"
#if [ $ERRORCODE = 1 ]; then
#	echo -e "************************"
#	echo -e "Tables allready deleted."
#	echo -e "************************"
#fi

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
# 04/18/2020 : 0.0.3  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
