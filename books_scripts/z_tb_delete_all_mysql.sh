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
# Rev. No.  : 0.0.4                                                 #
# ----------------------------------------------------------------- #
#
Uname="dondb"
Pword="dps0226db"

echo "InputValue = $1"

clear
cd /home/don/workspace/books

echo -e "  Delete all tables "
echo -e "---------------------\n"

returnValue=$(mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_all.sql 2>&1)
echo "retunValue = $returnValue"
#ERRORCODE=$?
#echo "1-ERRORCODE = $ERRORCODE"

echo -e "\nDelete all migration create tables "
echo -e "--"
ls /home/don/workspace/books/db/migrate/*_create*.* 2>/dev/null
ERRORCODE=$?
#echo "2-ERRORCODE = $ERRORCODE"
echo -e "--"
if [ $ERRORCODE -eq 2 ]; then
	echo -e "\t*****************************"
	echo -e "\tNo migration files to delete."
	echo -e "\t*****************************"
else
	echo ""
	# The -v will display removed in from of the file names it's deleting
	rm -v /home/don/workspace/books/db/migrate/*_create*.* #2>/dev/null
	ERRORCODE=$?
	#echo "3-ERRORCODE = $ERRORCODE"
	if [ $ERRORCODE -gt 0 ]; then
		echo -e "**********************************"
		echo -e "Problems Removing migration files."
		echo -e "**********************************"
	fi
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
# 04/17/2020 : 0.0.3  : Add else to errorcode chack on ls command.  #
#            :        : Move rm command under else.                 #
#            :        : Add option -v to rm command do diaplay      #
#            :        :   removed in front of file being deleted.   #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.4  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
