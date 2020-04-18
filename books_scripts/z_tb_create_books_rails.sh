#!/bin/bash
#
# This will create the migration file to create the table books
# and all of it's fields in the databaces book_development.
# Then run the migration file to create the table books. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_create_books_rails.sh                            #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

clear
cd /home/don/workspace/books

echo -e "  Creating table books"
echo -e "------------------------\n"

rails generate migration CreateBook author:string{50} title:string{25} series_name:string{25} series_no:integer:unsigned isbn_tab_no:string{20} publisher:string{20} published_date:date location:string{20} price:decimal{5.2} purchase_date:date entry_date:date condition_id:integer{2} media_type_id:integer{2} purpose_id:integer{3}
#Errorcode1=$?
#echo -e "\n error code1 = $Errorcode1 \n"


rake db:migrate
#Errorcode2=$?
#echo -e "\n error code1 = $Errorcode2 \n"

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
