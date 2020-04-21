#!/bin/bash
#
# This will run Mysql and delete (drop) all 4 tables.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_delete_all_mysql.sh                              #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.1.1                                                 #
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

_delete_books()
{
	echo -e "Deleting table books \n"

	#Errorcode=$?
	#echo -e "\n errorcode = $Errorcode \n"
}

_delete_conditions()
{
	echo -e "Deleting table conditions \n"

	#Errorcode=$?
	#echo -e "\n errorcode = $Errorcode \n"
}

_delete_media_types()
{
	echo -e "Deleting table media_types \n"

	#Errorcode1=$?
	#echo -e "\n errorcode = $Errorcode3\n"
}

_delete_purposes()
{
	echo -e "Deleting table purpose \n"

	#Errorcode=$?
	#echo -e "\n errorcode = $Errorcode \n"
}

_delete_all()
{
	# $1 = deleteMigration, $2 = deleteTable
	#echo "deleteMigration = $ 1 = $1"
	#echo "deleteTables    = $ 2 = $2"

	if [ $2 == "all" ]; then
		letterS="s"
		#fileNamePart=${1}
	else
		letterS=""
		#fileNamePart=${1}*
	fi
	echo -e "Deleting $2 table$letterS.... \n"

	# this keeps - warning using password on command line.
	#returnCode0=$(mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_${2}.sql 2>&1 >/dev/null)
	#ERRORCODE=$?
	#echo "1.0-ERRORCODE = $ERRORCODE"
	#echo "ReturnCode0 = $returnCode0"
	#echo "Next 0"	
	#echo ""

	# this removes - warning using password on command line.
	#returnCode1=$(mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_${2}.sql 2>/dev/null)
	mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_${2}.sql 2>/dev/null
	ERRORCODE=$?
	#echo "1.1-ERRORCODE = $ERRORCODE"
	#echo "ReturnCode1 = $returnCode1"
	#echo "Next 1"	
	#echo ""

	# this keeps - warning using password on command line.
	#returnCode2=$(mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_${2}.sql 1>/dev/null)
	#ERRORCODE=$?
	#echo "1.2-ERRORCODE = $ERRORCODE"
	#echo "ReturnCode2 = $returnCode2"
	#echo "End"
	#echo ""

	# this keeps - warning using password on command line.
	#returnCode3=$(mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_delete_${2}.sql 1>&2 >/dev/null)
	#ERRORCODE=$?
	#echo "1.3-ERRORCODE = $ERRORCODE"
	#echo "ReturnCode3 = $returnCode3"
	#echo "End"


	# $1 = w/deleteMigration, $2 = deleteTable
	if [ $ERRORCODE -eq 0 ]; then
		echo -e "     --- Deleting migration \"*${1}.*\" file$letterS. ---"
		echo -e "--"

		# w/d remove cannot access. remove ls.
		# w/o keep cannot acces. remove ls.
		#ls ./db/migrate/*$deleteMigrate*.* 1>&2 >/dev/null
		#ERRORCODE=$?
		#echo "2.0-ERRORCODE = $ERRORCODE"
		#echo "2.0"
		#echo "Next 0"
		#echo ""

		# w/d remove cannot access.  remove ls
		# w/o keep cannot acces. remove ls.
		#ls ./db/migrate/*$deleteMigrate*.* 1>/dev/null
		#ERRORCODE=$?
		#echo "2.1-ERRORCODE = $ERRORCODE"
		#echo "Next 1"
		#echo ""

		# w/d keep cannot access. remove ls.
		# w/o remove cannot acces. remove ls.
		#ls ./db/migrate/*$deleteMigrate*.* 2>/dev/null
		#ERRORCODE=$?
		#echo "2.2-ERRORCODE = $ERRORCODE"
		#echo "next 2 - No data good"
		#echo ""

		# w/d remove cannot access. remove ls.
		# w/o keep cannot acces. remove ls.
		#ls ./db/migrate/*$deleteMigrate*.* 2>&1> /dev/null
		#ERRORCODE=$?
		#echo "2.3-ERRORCODE = $ERRORCODE"
		#echo "2.3"
		#echo "Next 3"
		#echo ""

		# w/d remove cannot access. remove ls.
		# w/o keep cannot acces. remove ls.
		checkName=`ls ./db/migrate/*${1}*.* 2> /dev/null`
		#echo "CheckName = $checkName"

   	if [ -z "${checkName}" ]; then
   		#echo "     No File Exists"
			echo -e "\t*****************************"
			echo -e "\tNo migration files to delete."
			echo -e "\t*****************************"
   	else
   		#echo "     File Exists"
			#echo -e "2b--"
			# The -v will display removed in from of the file names it's deleting
			#rm -v ./db/migrate/*$deleteMigrate*.* #2>/dev/null
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
		#echo "2.4"
		#echo "End"
		#echo ""
		#exit

	# 	echo -e "--"
	# 	if [ $ERRORCODE -eq 2 ]; then
	# 		echo -e "\t*****************************"
	# 		echo -e "\tNo migration files to delete."
	# 		echo -e "\t*****************************"
	# 	else
	# 		echo -e "--"
	# 		# The -v will display removed in from of the file names it's deleting
	# 		#rm -v ./db/migrate/*$deleteMigrate*.* #2>/dev/null
	# 		rm -v ./db/migrate/*${1}*.* #2>/dev/null
	# 		ERRORCODE=$?
	# 		#echo "3-ERRORCODE = $ERRORCODE"
	# 		if [ $ERRORCODE -gt 0 ]; then
	# 			echo -e "**********************************"
	# 			echo -e "Problems Removing migration files."
	# 			echo -e "**********************************"
	# 		fi
	# 		echo -e "--"
	# 	fi
	#else
	# 	_press_enter
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
		#echo -e "  Deleting $deleteTable table....\n"

		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable

		#echo -e "Delete file(s) that has $deleteMigrate part of the file name.\n"
		#ls ./db/migrate/*$deleteMigrate.* 2>/dev/null
		;;

	2 )
		deleteMigrate="_condition"
		deleteTable="conditions"
		#echo -e "  Deleting $deleteTable table....\n"

		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable

		#echo -e "Delete file(s) that has $deleteMigrate part of the file name."
		#ls ./db/migrate/*$deleteMigrate.* 2>/dev/null
		;;

	3 )
		deleteMigrate="_media_type"
		deleteTable="media_types"
		#echo -e "  Deleting $deleteTable table....\n"

		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable

		#echo -e "Delete file(s) that has $deleteMigrate part of the file name."
		#ls ./db/migrate/*$deleteMigrate.* 2>/dev/null
		;;

	4 )
		deleteMigrate="_purpose"
		deleteTable="purposes"
		#echo -e "  Deleting $deleteTable table....\n"

		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable

		#echo -e "Delete file(s) that has $deleteMigrate part of the file name."
		#ls ./db/migrate/*$deleteMigrate.* 2>/dev/null
		;;

	8 )
		deleteMigrate="_create*"
		deleteTable="all"
		#echo "..."

		# passing variables $deleteMigrate & $deleteTable parital names.
		_delete_all $deleteMigrate $deleteTable

		#echo "..."
		#ls ./db/migrate/*$deleteMigrate*.* 2>/dev/null
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
# 04/20/2020 : 1.1.2  : Move section 8 to a function _delete_all.   #
#            :        : Remove info from section 1 to 4.            #
#            :        : Add variables to pass to _delete_all,       #
#            :        :   and call function _delete_all.            #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
