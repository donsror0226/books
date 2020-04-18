#
# This loads the table media_types from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_media_types.sql                               #
# Rev. Date : 04/16/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO media_types(media_type_id, media_type_name)
VALUES
	(1, "3.5"),
	(2, "5.25"),
	(3, "CD"),
	(4, "DVD"),
	(5, "Blue-Ray"),
	(6, "VHS"),
	(7, "Cassette"),
	(8, "Cartridge"),
	(9, "-");

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
