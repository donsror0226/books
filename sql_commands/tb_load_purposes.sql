#
# This loads the table purposes from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_purposes.sql                                  #
# Rev. Date : 04/17/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO purposes(purpose_id, purpose_type, purpose_name)
VALUES
	(10, "OS", "TRS"),
	(20, "OS", "Commodore 64"),
	(21, "OS", "Commodore 128"),
	(30, "OS", "Timex"),
	(40, "OS", "C-Misc"),
	(50, "OS", "Linux/..."),
	(60, "OS", "DOS"),
	(70, "OS", "Win 3.x"),
	(71, "OS", "Win 95"),
	(72, "OS", "Win 98"),
	(73, "OS", "Win 2000"),
	(74, "OS", "Win 2003"),
	(75, "OS", "Win NT"),
	(76, "OS", "Win Vista"),
	(77, "OS", "Win 7"),
	(78, "OS", "Win 8"),
	(79, "OS", "Win 9"),
	(80, "OS", "Win 10"),
	(100, "OS", "Arduino"),
	(110, "OS", "Pi 3"),
	(120, "OS", "Pi 4"),

	(200, "Consoles",	"DS Lite"),
	(210, "Consoles", "PS"),
	(211, "Consoles", "PS2"),
	(212, "Consoles", "PS3"),
	(213, "Consoles", "PS4"),
	(220, "Consoles", "XBox"),
	(221, "Consoles", "XB0x 360"),
	(222, "Consoles", "XB0x 1"),

	(300, "Hobbies", "Electronics"),
	(301, "Hobbies", "Cooking"),
	(302, "Hobbies", "Fishing"),

	(400, "Books", "Fictiion"),
	(401, "Books", "Non-Fiction (True)"),
	(402, "Books", "Si-Fi"),
	(403, "Books", "Fantsy"),
	(404, "Books", "Eduction"),
	(405, "Books", "Weterns"),
	(406, "Books", "War");

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/17/2020 : 0.0.2  : Inserte a new column 2 purpose_type         #
#            :        : 	into purposes table,                      #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
