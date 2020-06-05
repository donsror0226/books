#
# This loads the table purposes from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_purposes.sql                                  #
# Rev. Date : 05/25/2020                                            #
# Rev. No.  : 0.0.4                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO purposes(purpose_idx, purpose_type, purpose_name, created_at, updated_at)
VALUES
	(0, "N/A", "N/A",           NOW(), NOW() ),
	(10, "OS", "TRS",           NOW(), NOW() ),
	(20, "OS", "Commodore 64",  NOW(), NOW() ),
	(30, "OS", "Commodore 128", NOW(), NOW() ),
	(40, "OS", "Timex",         NOW(), NOW() ),
	(50, "OS", "C-Misc",        NOW(), NOW() ),
	(60, "OS", "Linux/...",     NOW(), NOW() ),
	(70, "OS", "DOS",           NOW(), NOW() ),
	(80, "OS", "Win 3.x",       NOW(), NOW() ),
	(90, "OS", "Win 95",        NOW(), NOW() ),
	(100, "OS", "Win 98",       NOW(), NOW() ),
	(110, "OS", "Win 2000",     NOW(), NOW() ),
	(120, "OS", "Win 2003",     NOW(), NOW() ),
	(130, "OS", "Win NT",       NOW(), NOW() ),
	(140, "OS", "Win Vista",    NOW(), NOW() ),
	(150, "OS", "Win 7",        NOW(), NOW() ),
	(160, "OS", "Win 8",        NOW(), NOW() ),
	(170, "OS", "Win 9",        NOW(), NOW() ),
	(180, "OS", "Win 10",       NOW(), NOW() ),
	(190, "OS", "Arduino",      NOW(), NOW() ),
	(200, "OS", "Pi 3",         NOW(), NOW() ),
	(210, "OS", "Pi 4",         NOW(), NOW() ),

	(400, "Consoles",	"DS Lite",  NOW(), NOW() ),
	(410, "Consoles", "PS",       NOW(), NOW() ),
	(420, "Consoles", "PS2",      NOW(), NOW() ),
	(430, "Consoles", "PS3",      NOW(), NOW() ),
	(440, "Consoles", "PS4",      NOW(), NOW() ),
	(450, "Consoles", "XBox",     NOW(), NOW() ),
	(460, "Consoles", "XB0x 360", NOW(), NOW() ),
	(470, "Consoles", "XB0x 1",   NOW(), NOW() ),

	(700, "Hobbies", "Electronics",      NOW(), NOW() ),
	(710, "Hobbies", "Cooking",          NOW(), NOW() ),
	(720, "Hobbies", "Fishing",          NOW(), NOW() ),
	(730, "Hobbies", "Home Improvement", NOW(), NOW() ),
	(740, "Hobbies", "Guns",             NOW(), NOW() ),

	(1000, "Genre", "Fiction",            NOW(), NOW() ),
	(1010, "Genre", "Non-Fiction (True)", NOW(), NOW() ),
	(1020, "Genre", "Si Fi",              NOW(), NOW() ),
	(1030, "Genre", "Fantasy",            NOW(), NOW() ),
	(1040, "Genre", "Education",          NOW(), NOW() ),
	(1050, "Genre", "Western",            NOW(), NOW() ),
	(1060, "Genre", "War",                NOW(), NOW() );

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
# 05/25/2020 : 0.0.4  : Reorder Purpose.                            #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
