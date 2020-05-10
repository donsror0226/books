#
# This delete the table mediatypes from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : delete_tb_mediatypes.sql                              #
# Rev. Date : 05/09/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

drop table IF EXISTS mediatypes;

#show tables;

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/09/2020 : 0.0.1  : Original. Copyed from tb_delete_media_sql.  #
#            :        :   tb_delete_media_type_sql.                 #
#            :        :   tb_delete_mediatype_sql.                  #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
