#
# This loads the table conditions from database_develpment if it exists.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/sql_commands                #
# File Name : tb_load_conditions.sql                                #
# Rev. Date : 05/08/2020                                            #
# Rev. No.  : 0.0.3                                                 #
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

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/26/2020 : 0.0.2  : Add fields created_at, updated_at.          #
# ----------------------------------------------------------------- #
# 05/08/2020 : 0.0.3  : Add an x to end of _id.                     #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
