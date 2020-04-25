#!/bin/bash
#
# This will create the empty migration file to all 4 tables.
# ####and all of it's fields in the database book_development.####
# ####Then run the migration files to create the 4 tables.#### 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_create_all_rails.sh                              #
# Rev. Date : 04/25/2020                                            #
# Rev. No.  : 0.1.6                                                 #
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
deleteFile="none"						# Hold partial name of file(s) you want to delete.
migrationBuildName="none"		# Hold partial name of build migration Name.
														#   Book, Condition, media_type, Purpose.
migrationFileName="none"		# Hold partial name of migration file name.
														#   book, condition, media_type, purpose.
tableName="none"						# Hold partial name of table.
originalFile="none"					# Hold name of original file to work on.
fileIn="none"								# Hold a copy of original that will be worked on.

#####################
##### Functions #####
#####################


_create_migration()
{
	# $1 = migrationBuildName, $2 = migrationFileName
	#echo -e "Creating empty migration file...\n"
	#echo "1-migrationBuildName     = $ 1 = $1"
	#echo "1-migrationFileName = $ 2 = $2"

	#rails generate migration CreatePurpose purpose_id:integer{3} purpose_type:string{15} purpose_name:string{20}
	#rails generate migration CreatePurpose
	#rails generate migration Create$1
	#rails generate migration Create$1 --force
	rails generate migration Create$1 --force 1>/dev/null
	#bash -c 'rails generate migration Create$1 --force' 2>&1 >/dev/null
	Errorcode=$?
	#echo "Errorcode = $Errorcode"
	#echo "------------------------------------------------"
	#echo ""
	#echo -e "purpose - Errorcode = $Errorcode \n"
}

_insert_into_migration()
{
	# $1 = migrationBuildName, $2 = migrationFileName
	## Part 1
	##   
	#
	# Holds the basic file name of the migration file = 
	#		"*_book*.*", "*_condition*.*", "*_media_type*.*", "*_purpose*.*"
	# Then copy originalFile to fileIn to work on.
	migratePath="./db/migrate"
	echo "1a"
	originalFile=$(ls ${migratePath}/*_${2}*.*)
	#cat $originalFile
	#cp -v $originalFile ${migratePath}/tempFileIn
	cp $originalFile ${migratePath}/tempFileIn
	# echo "------------------------------------"
	# #diff -qB $originalFile ${migratePath}/tempFileIn 2>&1 >/dev/null
	# #echo $?
	# exit 

	# Copy basic migration file fileIn to tempfileIn.
	# cp $tempFileIn ./db/migrate/tempFileIn
	# cat ${migratePath}/tempFileIn
	# echo "1c"

	sed -e '/'${2}'/r '${migratePath}'/'${2}'_fields.txt' ${migratePath}/tempFileIn > ${migratePath}/newFile.txt

	#mv -f ${migratePath}/newFile.txt ${migratePath}/newFile.rb
	mv -f ${migratePath}/newFile.txt $originalFile
	#echo " These 3 lines are not needed."
	#echo "   This is a cat of file $(basename ${originalFile})."
	#echo ""
	#cat $originalFile
	# If you need you can add a question does this look good ?
	echo ""
	echo -e "**********************************************************************"
	echo -e "$2 migration file $originalFile created."
	echo -e "**********************************************************************\n"
	cat $originalFile
	#_press_enter
}

_remove_files()
{
	echo -e "\tRemoving temporary working files.....\n"
	#rm -v ${migratePath}/newFile.txt 					# output of sed working file.
	rm -v ${migratePath}/tempFileIn 					# 
	#rm -v ${migratePath}/newFile.rb						# copy output file to original file.
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

clear

#cd /home/don/workspace/books

echo -e "  Creating Migration Files"
echo -e "----------------------------\n"
#echo -e "Variable passed = $1 \n"

case $1 in
	1 )
		echo -e "\tCreating Migration for \"books\"....\n"
		#_create_books
		migrationBuildName="Book"
		migrationFileName="book"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName
		_remove_files
		;;

	2 )
		echo -e "\tCreating Migration for \"conditions\"....\n"
		#_create_conditions
		migrationBuildName="Condition"
		migrationFileName="condition"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName
		_remove_files
		;;

	3 )
		echo -e "\tCreating Migration for \"media_types\"....\n"
		#_create_media_types
		migrationBuildName="Media_type"
		migrationFileName="media_type"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName
		_remove_files
		;;

	4 )
		echo -e "\tCreating Migration for \"purposes\"....\n"
		#_create_purposes
		migrationBuildName="Purpose"
		migrationFileName="purpose"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName
		_remove_files
		;;

	8 )
		echo -e "\tCreating all Migrating for all tables....\n"
		#_create_books
		migrationBuildName="Book"
		migrationFileName="book"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName

		#_create_conditions
		migrationBuildName="Condition"
		migrationFileName="condition"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName

		#_create_media_types
		migrationBuildName="Media_type"
		migrationFileName="media_type"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName

		#_create_purposes
			migrationBuildName="Purpose"
		migrationFileName="purpose"

		_create_migration $migrationBuildName $migrationFileName
		_insert_into_migration $migrationBuildName $migrationFileName

		# remove all temporary
		_remove_files
	;;

  # * )
  #   # Change text color to Red 1. #
  #   # Change text to  bold.       #
  #   echo -en "$(tput setaf 1)"
  #   echo -e "$(tput bold)"
  #   echo -e "\n     Entered wrong value ($1) try agin. )\n\n"
  #   echo -e "$(tput setab 4)$(tput el)"
	#		echo -en "         Press Enter to continue"
	#		read
	#		exit
  #   ;;

esac

#echo "$ 1 = $1"
#echo "$ 2 = $2"
#echo -e "\n\tMigration file(s) created.....\n"
# call function _press enter to continue.
# _press_enter

#echo -e "\n 0a-Errorcode =  $Errorcode \n"
#if [ $Errorcode -ne 0 ]; then
	#echo -e "\n\n"
	#echo -e "\t-----------------------------------------------"
	#echo -e "\tCreating all tables using Migration file(s)...."
	#echo -e "\t-----------------------------------------------\n"
	#rake db:migrate
	#Errorcode=$?
	#echo -e "\n 0-errorcode = $Errorcode \n"
#fi
#exit $Errorcode
exit 0

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.2  : Changed table media to table media_types.   #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.3  : Changed table type to table purposes.       #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.4  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.1.0  : Take case 1 - 8 and put in to their own     #
#            :        :   functions.                                #
#            :        : Change case name from $InputValue to $1     #
#            :        :   this is the value pased from              #
#            :        :   z_menu_tb_create.sh.                      #
#            : 0.1.1  : Change path to relative path.               #
# ----------------------------------------------------------------- #
# 04/22/2020 : 0.1.2  : Remove migrate from bottom of code.         #
# ----------------------------------------------------------------- #
# 04/24/2020 : 0.1.3  : Add function _create_migration.             #
#            :        : Add function _insert_into_migration.        #
#            : 0.1.4  : Clean up remove unneeded code.              #
#            : 0.1.5  : Add function _remove_files. temporary files #
#            :        :   and more clean up.                        #
# ----------------------------------------------------------------- #
# 04/25/2020 : 0.1.6  : Remove function not needed.                 #
#            :        :   _create_book, _create_condition,          #
#            :        :   _create_media_type, _create_purpose.      #
#            :        : Add passing variables in section 2,3,4 & 8. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
