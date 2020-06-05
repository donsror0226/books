#
# This loads the table booktypes from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_booktypes.sql                                 #
# Rev. Date : 05/252020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO booktypes(book_type_idx, book_type_name, created_at, updated_at)
VALUES
	(0, "N/A",      NOW(), NOW() ),
	(1, "Hard",     NOW(), NOW() ),
	(2, "Soft",     NOW(), NOW() ),
	(3, "Magazine", NOW(), NOW() ),
	(4, "Audible",  NOW(), NOW() ),
	(5, "MP3",      NOW(), NOW() ),
	(6, "Paper",    NOW(), NOW() );
# can have more then one choice. (check box).

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/09/2020 : 0.0.1  : Original. Copyed from tb_book_types.sql.    #
# ----------------------------------------------------------------- #
# 05/25/2020 : 0.0.2  : Add option 6 "Paper" to booktype.           #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
