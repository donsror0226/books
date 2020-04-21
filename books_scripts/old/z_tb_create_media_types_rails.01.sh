#!/bin/bash
#
# This will create the migration file to create the table media_types
# and all of it's fields in the databaces book_development.
# Then run the migration file to create the table media_types. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_create_tb_media_types_rails.sh                      #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating table media_types"
echo -e "------------------------------\n"

rails generate migration CreateMedia_type media_type_id:integer{2} media_type_name:string{15}
#Errorcode=$?
#echo -e "\n error code = $Errorcode \n"


rake db:migrate
#Errorcode=$?
#echo -e "\n error code = $Errorcode \n"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal. Copyed from                        #
#            :        : tb_create_media_rails.sh.                   #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.2  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
