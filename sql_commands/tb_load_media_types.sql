#
# This loads the table media_types from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_media_types.sql                               #
# Rev. Date : 04/26/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO media_types(media_type_id, media_type_name, created_at, updated_at)
VALUES
	(1, "3.5",       NOW(), NOW() ),
	(2, "5.25",      NOW(), NOW() ),
	(3, "CD",        NOW(), NOW() ),
	(4, "Cassette",  NOW(), NOW() ),
	(5, "Cartridge", NOW(), NOW() ),
	(6, "NA",        NOW(), NOW() );

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/26/2020 : 0.0.2  : Add fields created_at, updated_at.          #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
