#
# This delete the databases (books_) if they exists.
# Then create the databases (books_).
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books                             #
# File Name : setup_database.sql                                    #
# Rev. Date : 04/10/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

drop database IF EXISTS books_development;
create database books_development;

drop database IF EXISTS books_production;
create database books_production;

drop database IF EXISTS books_test;
create database books_test;

show databases;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/10/2020 : 0.0.0  : Orginal.                                    #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
