#
# This delete the table book_types from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_delete_book_types.sql                              #
# Rev. Date : 05/05/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

drop table IF EXISTS book_types;

#show tables;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/04/2020 : 0.0.1  : Original. Copyed from                       #
#            :        :    tb_delete_media_type.sql                 #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
