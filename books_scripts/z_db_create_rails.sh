#!/bin/bash
#
# Creat three databases.
# book_develpment, book_production, book_test.
# Using the rails command.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_db_create_rails.sh                                  #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.2                                                 #
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

echo -e "  Creating databases using Rails"
echo -e "----------------------------------\n"

# optional # 2
rails db:create:all
Errorcode2=$?
echo -e "\n errorcode2 = $Errorcode2 \n"

#_press_enter

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/12/2020 : 0.0.1  : Orginal. (copyed from z_db_create_rake).    #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.2  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
