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
	(0, "N/A",       NOW(), NOW() ),
	(1, "3.5",       NOW(), NOW() ),
	(2, "5.25",      NOW(), NOW() ),
	(3, "CD",        NOW(), NOW() ),
	(4, "Cassette",  NOW(), NOW() ),
	(5, "Cartridge", NOW(), NOW() ),
	(6, "Paper",     NOW(), NOW() );

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/09/2020 : 0.0.3  : Original. Copyed from                       #
#            :        :   tb_load_media_types.sql.                  #
#            :        : Reorderd table put "N/A" at the top.        #
# ----------------------------------------------------------------- #
# 05/25/2020 : 0.0.4  : Add option 7 "Paper" to mediatype.          #
#            :        : Reorder mediatype starting at 0.            #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
