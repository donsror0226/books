#
# This delete the table purposes from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_delete_purposes.sql                                #
# Rev. Date : 04/16/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

drop table IF EXISTS purposes;

#show tables;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original. Copyed from delete_tb_types.sql.  #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
