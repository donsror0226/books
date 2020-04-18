#!/bin/bash
#
# Creat three databases.
# book_develpment, book_production, book_test.
# Using the rake command.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_db_create_rake.sh                                   #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.4                                                 #
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

echo -e "  Creating databases using Rake"
echo -e "---------------------------------\n"

# optional # 1
rake db:create:all
#Errorcode1=$?
#echo -e "\n error code1 = $Errorcode1 \n"

#_press_enter

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/09/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
# 04/12/2020 : 0.0.2  : Add a 2nd way of creatting your databases.  #
# ----------------------------------------------------------------- #
# 04/12/2020 : 0.0.3  : Move option 2 to new file                   #
#            :        : z_db_create_rails.sh.                       #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.4  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
