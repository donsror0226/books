#!/bin/bash
#
# This will run Mysql and delete (drop) the three databases for (books_).
#	book_develpment, book_production, book_test.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_db_delete_mysql.sh                                  #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.3                                                 #
# ----------------------------------------------------------------- #
#


#####################
##### Variables #####
#####################

Errorcode=0                 # Hold error code $?


#####################
##### Functions #####
#####################

_press_enter()
{
  echo -en "Press Enter to continue "
  read
  clear
}


########################
##### Main Program #####
########################

clear
cd /home/don/workspace/books

echo -e "  Delete databases"
echo -e "--------------------\n"

mysql -u dondb -pdps0226db < ./sql_commands/db_delete.sql
#ERRORCODE=$?
#echo "ERRORCODE = $ERRORCODE"


#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/10/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.2  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.0.3  : Change path to relative path.               #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
