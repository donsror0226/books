#
# This loads all 3 tables for database_develpment.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_all.sql                                       #
# Rev. Date : 05/08/2020                                            #
# Rev. No.  : 0.0.4                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO conditions(condition_idx, condition_name, created_at, updated_at)
VALUES
	(1, "Excelent", NOW(), NOW() ),
	(2, "Good",     NOW(), NOW() ),
	(3, "Fair",     NOW(), NOW() ),
	(4, "poor",     NOW(), NOW() ),
	(5, "Replace",  NOW(), NOW() );


INSERT INTO media_types(media_type_idx, media_type_name, created_at, updated_at)
VALUES
	(1, "3.5",       NOW(), NOW() ),
	(2, "5.25",      NOW(), NOW() ),
	(3, "CD",        NOW(), NOW() ),
	(4, "Cassette",  NOW(), NOW() ),
	(5, "Cartridge", NOW(), NOW() ),
	(6, "NA",        NOW(), NOW() );


INSERT INTO purposes(purpose_idx, purpose_type, purpose_name, created_at, updated_at)
VALUES
	(10, "OS", "TRS",           NOW(), NOW() ),
	(20, "OS", "Commodore 64",  NOW(), NOW() ),
	(21, "OS", "Commodore 128", NOW(), NOW() ),
	(30, "OS", "Timex",         NOW(), NOW() ),
	(40, "OS", "C-Misc",        NOW(), NOW() ),
	(50, "OS", "Linux/...",     NOW(), NOW() ),
	(60, "OS", "DOS",           NOW(), NOW() ),
	(70, "OS", "Win 3.x",       NOW(), NOW() ),
	(71, "OS", "Win 95",        NOW(), NOW() ),
	(72, "OS", "Win 98",        NOW(), NOW() ),
	(73, "OS", "Win 2000",      NOW(), NOW() ),
	(74, "OS", "Win 2003",      NOW(), NOW() ),
	(75, "OS", "Win NT",        NOW(), NOW() ),
	(76, "OS", "Win Vista",     NOW(), NOW() ),
	(77, "OS", "Win 7",         NOW(), NOW() ),
	(78, "OS", "Win 8",         NOW(), NOW() ),
	(79, "OS", "Win 9",         NOW(), NOW() ),
	(80, "OS", "Win 10",        NOW(), NOW() ),
	(100, "OS", "Arduino",      NOW(), NOW() ),
	(110, "OS", "Pi 3",         NOW(), NOW() ),
	(120, "OS", "Pi 4",         NOW(), NOW() ),

	(200, "Consoles",	"DS Lite",  NOW(), NOW() ),
	(210, "Consoles", "PS",       NOW(), NOW() ),
	(211, "Consoles", "PS2",      NOW(), NOW() ),
	(212, "Consoles", "PS3",      NOW(), NOW() ),
	(213, "Consoles", "PS4",      NOW(), NOW() ),
	(220, "Consoles", "XBox",     NOW(), NOW() ),
	(221, "Consoles", "XB0x 360", NOW(), NOW() ),
	(222, "Consoles", "XB0x 1",   NOW(), NOW() ),

	(300, "Hobbies", "Electronics",      NOW(), NOW() ),
	(301, "Hobbies", "Cooking",          NOW(), NOW() ),
	(302, "Hobbies", "Fishing",          NOW(), NOW() ),
	(303, "Hobbies", "Home Improvement", NOW(), NOW() ),
	(304, "Hobbies", "Guns",             NOW(), NOW() ),

	(400, "Genre", "Fiction",            NOW(), NOW() ),
	(401, "Genre", "Non-Fiction (True)", NOW(), NOW() ),
	(402, "Genre", "Si Fi",              NOW(), NOW() ),
	(403, "Genre", "Fantasy",            NOW(), NOW() ),
	(404, "Genre", "Education",          NOW(), NOW() ),
	(405, "Genre", "Western",            NOW(), NOW() ),
	(406, "Genre", "War",                NOW(), NOW() );


INSERT INTO book_types(book_type_idx, book_type_name, created_at, updated_at)
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
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/17/2020 : 0.0.2  : Inserte a new column 2 purpose_type         #
#            :        : 	into purposes table,                      #
# ----------------------------------------------------------------- #
# 04/26/2020 : 0.0.3  : Add fields created_at, updated_at.          #
# ----------------------------------------------------------------- #
# 05/08/2020 : 0.0.4  : Add an x to end of all _id.                 #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
