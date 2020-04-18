#
# This delete all 4 tables from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_delete_all.sql                                     #
# Rev. Date : 04/162020                                            #
# Rev. No.  : 0.0.3                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

drop table IF EXISTS books;

drop table IF EXISTS conditions;

drop table IF EXISTS media_types;

drop table IF EXISTS purposes;

#show tables;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/14/2020 : 0.0.1  : Original. (copyed from tb_delete_books).    #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.2  : Changed table media to table media_types.   #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.3  : Changed table type to table purposes.       #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
