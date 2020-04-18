#
# This will run Mysql and grant access to  the three databases for (books_).
#	book_develpment, book_production, book_test.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : grant_db.sql                                          #
# Rev. Date : 04/12/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

GRANT ALL PRIVILEGES ON books_development.* TO 'don'@'localhost';
GRANT ALL PRIVILEGES ON books_development.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON books_development.* TO 'dondb'@'localhost';

GRANT ALL PRIVILEGES ON books_production.* TO 'don'@'localhost';
GRANT ALL PRIVILEGES ON books_production.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON books_production.* TO 'dondb'@'localhost';

GRANT ALL PRIVILEGES ON books_test.* TO 'don'@'localhost';
GRANT ALL PRIVILEGES ON books_test.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON books_test.* TO 'dondb'@'localhost';

show databases;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/12/2020 : 0.0.1  : Orginal.                                    #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
