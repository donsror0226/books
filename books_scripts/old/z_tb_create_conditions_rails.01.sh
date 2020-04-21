#!/bin/bash
#
# This will create the migration file to create the table conditions
# and all of it's fields in the databaces book_development.
# Then run the migration file to create the table conditions. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_create_conditions_rails.sql                      #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating table conditions"
echo -e "----------------------------- \n"

rails generate migration CreateCondition condition_id:integer{2} condition_name:string{10} 
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode1 \n"


rake db:migrate
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode2 \n"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.2  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
