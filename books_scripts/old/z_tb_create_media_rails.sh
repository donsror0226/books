#!/bin/bash
#
# This will create the migration file to create the table media 
# and all of it's fields in the databaces book_development.
# Then run the migration file to create the table media. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/bin/books_scripts/                          #
# File Name : z_create_tb_media_rails.sql                           #
# Rev. Date : 04/13/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating table media"
echo -e "------------------_-----\n"

rails generate migration CreateMedia media_id:integer media_name:string{15}
#Errorcode=$?
#echo -e "\n error code = $Errorcode \n"


rake db:migrate
#Errorcode=$?
#echo -e "\n error code = $Errorcode \n"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
