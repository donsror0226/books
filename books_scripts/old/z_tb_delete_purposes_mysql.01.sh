#!/bin/bash
#
# This will run Mysql and delete (drop) the table purposes.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_delete_purposes_mysql.sh                         #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Delete table purposes"
echo -e "-------------------------\n"

mysql -u dondb -pdps0226db < ./sql_commands/tb_delete_purposes.sql
#ERRORCODE=$?
#echo "1ERRORCODE = $ERRORCODE"


echo -e "\nDelete migration create_purpose "
echo -e "--"
ls /home/don/workspace/books/db/migrate/*_purpose.* 2>/dev/null
ERRORCODE=$?
#echo "2ERRORCODE = $ERRORCODE"
if [ $ERRORCODE -eq 2 ]; then
	echo -e "\t***************************"
	echo -e "\tNo migration file for type."
	echo -e "\t***************************"
fi
echo -e "--"


rm /home/don/workspace/books/db/migrate/*_purpose.* 2>/dev/null
ERRORCODE=$?
#echo "3ERRORCODE = $ERRORCODE"
if [ $ERRORCODE = 1 ]; then
	echo -e "***********************"
	echo -e "Table allready deleted."
	echo -e "***********************"
fi

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Orginal. Copyed tb_delete_types_rails.sh.   #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.2  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
