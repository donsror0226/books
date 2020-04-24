#!/bin/bash
#
# This will run Mysql and delete (drop) all 4 tables.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_delete_all_mysql.sh                              #
# Rev. Date : 04/20/2020                                            #
# Rev. No.  : 0.2.1                                                 #
# ----------------------------------------------------------------- #
#


#####################
##### Variables #####
#####################

Errorcode=0                 # Hold error code $?.
DB="Books"                  # Hold name of database.
DB1="books_developemnt"     # Hold name of database books_development.
DB2="books_production"      # Hold name of database books_production.
DB3="books_test"            # Hold name of database books_test.
Uname="dondb"
Pword="dps0226db"
deleteTable="none"					# Hold partial name of table(s) you want to delete.
deleteMigrate="none"				# Hold partial name of migrate file(s) you want
														#		to delete.
fileNamePart2="none"				# Hold partial name part2 of migrate file(s) you
														#		want to delete.		


#####################
##### Functions #####
#####################

_delete_all()
{
	# $1 = deleteMigration, $2 = deleteTable
	#echo "deleteMigration = $ 1 = $1"
	#echo "deleteTables    = $ 2 = $2"

	if [ $2 == "all" ]; then
		letterS="s"
	else
		letterS=""
	fi
	echo -e "Deleting $2 table$letterS.... \n"

	mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_${2}.sql 2>/dev/null
	ERRORCODE=$?
	#echo "1.1-ERRORCODE = $ERRORCODE"

	if [ $ERRORCODE -eq 0 ]; then
		echo -e "     --- Deleting migration \"*${1}.*\" file$letterS. ---"
		echo -e "--"

		checkName=`ls ./db/migrate/*${1}*.* 2> /dev/null`
		#echo "CheckName = $checkName"

   	if [ -z "${checkName}" ]; then
   		#echo "     No File Exists"
			echo -e "\t*****************************"
			echo -e "\tNo migration files to delete."
			echo -e "\t*****************************"
   	else
   		#echo "     File Exists"
			# The -v will display removed in front of the file names it's deleting
			rm -v ./db/migrate/*${1}*.* #2>/dev/null
			ERRORCODE=$?
			#echo "3-ERRORCODE = $ERRORCODE"
			if [ $ERRORCODE -gt 0 ]; then
				echo -e "**********************************"
				echo -e "Problems Removing migration files."
				echo -e "**********************************"
			fi
  	fi
		echo -e "--"
		ERRORCODE=$?
		#echo "2.4-ERRORCODE = $ERRORCODE"
	
	fi
}

_press_enter()
{
  echo -en "\nPress Enter to continue "
  read
  #clear
}


########################
##### Main Program #####
########################

#echo "InputValue = $1"

clear
#cd /home/don/workspace/books

echo -e "  Deleting tables "
echo -e "-------------------\n"

case $1 in
	1 )
		deleteMigrate="_book"
		deleteTable="books"
		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable
		;;

	2 )
		deleteMigrate="_condition"
		deleteTable="conditions"
		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable
		;;

	3 )
		deleteMigrate="_media_type"
		deleteTable="media_types"
		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable
		;;

	4 )
		deleteMigrate="_purpose"
		deleteTable="purposes"
		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable
		;;

	8 )
		deleteMigrate="_create*"
		deleteTable="all"
		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable
		;;

esac

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Orginal. Copyed form                        #
#            :        : tb_delete_books_mysql.sh.                   #
# ----------------------------------------------------------------- #
# 04/14/2020 : 0.0.2  : Add stderr (2) to rm command.               #
#            :        : Add errorcode test to rm command.           #
# ----------------------------------------------------------------- #
# 04/17/2020 : 0.0.3  : Add else to errorcode chack on ls command.  #
#            :        : Move rm command under else.                 #
#            :        : Add option -v to rm command do diaplay      #
#            :        :   removed in front of file being deleted.   #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.4  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.1.0  : Take case 1 - 8 and put in to their own     #
#            :        :   functions.                                #
#            :        : Change case name from $InputValue to $1     #
#            :        :   this is the value pased from              #
#            :        :   z_menu_tb_delete.sh.                      #
#            : 0.1.1  : Change path to relative path.               #
# ----------------------------------------------------------------- #
# 04/20/2020 : 0.2.0  : Move section 8 to a function _delete_all.   #
#            :        : Remove info from section 1 to 4.            #
#            :        : Add variables to pass to _delete_all,       #
#            :        :   and call function _delete_all.            #
#            : 0.2.1  : Remove unneeded code. Cleanup.              #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
