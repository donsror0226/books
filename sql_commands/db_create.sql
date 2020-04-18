#
# This will create the databases (books_).
#	book_develpment, book_production, book_test.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : db_create.sql                                         #
# Rev. Date : 04/10/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

create database IF not EXISTS books_development;

create database IF not EXISTS books_production;

create database IF not EXISTS books_test;

show databases;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/10/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
