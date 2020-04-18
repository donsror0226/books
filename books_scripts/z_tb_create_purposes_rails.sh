#!/bin/bash
#
# This will create the migration file to create the table purposes
# and all of it's fields in the databaces book_development.
# Then run the migration file to create the table purposes. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_create_purposes_rails.sh                         #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.3                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating table purposes"
echo -e "---------------------------\n"

rails generate migration CreatePurpose purpose_id:integer{2} purpose_type:string{15} purpose_name:string{20}
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode \n"


rake db:migrate
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode2 \n"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Orginal. Copyed tb_create_type_rails.sh.    #
# ----------------------------------------------------------------- #
# 04/17/2020 : 0.0.2  : Inserte a new column 2 purpose_type         #
#            :        : 	into purposes table,                      #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.3  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
