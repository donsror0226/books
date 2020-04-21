#!/bin/bash
#
# This will create the migration file to create the all 4 tables
# and all of it's fields in the databaces book_development.
# Then run the migration files to create the 4 tables. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_create_books_all.sh                              #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.4                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating all 4 tables"
echo -e "-------------------------\n"

echo -e "Creating table books \n"

rails generate migration CreateBook author:string{50} title:string{25} series_name:string{25} series_no:integer:unsigned isbn_tab_no:string{20} publisher:string{20} published_date:date location:string{20} price:decimal{5.2} purchase_date:date entry_date:date condition_id:integer{2} media_type_id:integer{2} purpose_id:integer{3}
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode \n"
#----------------------------------------------------------------------------

echo -e "Creating table conditions \n"

	rails generate migration CreateCondition condition_id:integer{2} condition_name:string{10} 
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode \n"
#----------------------------------------------------------------------------


echo -e "Creating table media_types \n"

rails generate migration CreateMedia_type media_type_id:integer{2} media_type_name:string{15}
#Errorcode1=$?
#echo -e "\n errorcode = $Errorcode3\n"
#----------------------------------------------------------------------------


echo -e "Creating table purpose \n"

rails generate migration CreatePurpose purpose_id:integer{3} purpose_type:string{15} purpose_name:string{20}
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode \n"
#----------------------------------------------------------------------------


rake db:migrate
#Errorcode=$?
#echo -e "\n errorcode= $Errorcode \n"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.2  : Changed table media to table media_types.   #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.3  : Changed table type to table purposes.       #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.4  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
