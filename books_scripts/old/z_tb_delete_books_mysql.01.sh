#!/bin/bash
#
# This will run Mysql and delete (drop) the table books.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_delete_books_mysql.sh                            #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.3                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Delete table books"
echo -e "----------------------\n"

mysql -u dondb -pdps0226db < ./sql_commands/tb_delete_books.sql
#ERRORCODE=$?
#echo "1ERRORCODE = $ERRORCODE"


echo -e "\nDelete migration file create book "
echo -e "--"
ls /home/don/workspace/books/db/migrate/*_book.* 2>/dev/null
ERRORCODE=$?
#echo "2ERRORCODE = $ERRORCODE"
if [ $ERRORCODE -eq 2 ]; then
	echo -e "\t***************************"
	echo -e "\tNo migration file for book."
	echo -e "\t***************************"
fi
echo -e "--"


rm /home/don/workspace/books/db/migrate/*_book.* 2>/dev/null
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
# 04/10/2020 : 0.0.1  : Orginal.                                    #
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
