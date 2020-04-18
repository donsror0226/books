#
# This delete the three databases (books_) if they exists.
#	book_develpment, book_production, book_test.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : delete_db.sql                                         #
# Rev. Date : 04/10/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

drop database IF EXISTS books_development;

drop database IF EXISTS books_production;

drop database IF EXISTS books_test;

show databases;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/10/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
