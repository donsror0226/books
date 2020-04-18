#!/bin/bash
#
# This will create the migration file to create the table types
# and all of it's fields in the databaces book_development.
# Then run the migration file to create the table types. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/bin/books_scripts/                          #
# File Name : z_tb_create_types_rails.sh                            #
# Rev. Date : 04/13/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating table types"
echo -e "------------------------\n"

rails generate migration CreateType type_id:integer type_name:string{15}
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode \n"


rake db:migrate
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode2 \n"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
