#
# This loads the table book_types from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_book_types.sql                                #
# Rev. Date : 05/03/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO book_types(book_type_id, book_type_name, created_at, updated_at)
VALUES
	(1, "Hard",     NOW(), NOW() ),
	(2, "Soft",     NOW(), NOW() ),
	(3, "Magazine", NOW(), NOW() ),
	(4, "Audible",  NOW(), NOW() ),
	(5, "MP3",      NOW(), NOW() );
# can have more then one choice. (check box).

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/03/2020 : 0.0.1  : Original. Copyed from tb_media_types.sql.   #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
