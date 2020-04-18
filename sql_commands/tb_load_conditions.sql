#
# This loads the table conditions from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_conditions.sql                               #
# Rev. Date : 04/16/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#

use books_development;

INSERT INTO conditions(condition_id, condition_name)
VALUES
	(1, "Excelent"),
	(2, "Good"),
	(3, "Fair"),
	(4, "poor"),
	(5, "Replace");

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
