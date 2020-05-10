#
# This loads the table mediatypes from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_mediatypes.sql                                #
# Rev. Date : 05/09/2020                                            #
# Rev. No.  : 0.0.3                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO mediatypes(media_type_idx, media_type_name, created_at, updated_at)
VALUES
	(1, "N/A",       NOW(), NOW() ),
	(2, "3.5",       NOW(), NOW() ),
	(3, "5.25",      NOW(), NOW() ),
	(4, "CD",        NOW(), NOW() ),
	(5, "Cassette",  NOW(), NOW() ),
	(6, "Cartridge", NOW(), NOW() );

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/09/2020 : 0.0.3  : Original. Copyed from                       #
#            :        :   tb_load_media_types.sql.                  #
#            :        : Reorderd table put "N/A" at the top.        #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
