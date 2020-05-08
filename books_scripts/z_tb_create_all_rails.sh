#!/bin/bash
#
# This will create the empty migration file to all 4 tables.
#   and all of it's fields in the database book_development.
# Then run the migration files to create the 4 tables. 
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_tb_create_all_rails.sh                              #
# Rev. Date : 04/25/2020                                            #
# Rev. No.  : 0.1.7                                                 #
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
tempFileIn="none"						# Hold a copy of original file will be worked on.


#####################
##### Functions #####
#####################

_create_migration()
{
	## Pass variable $1 = migrationBuildName
	## Run the rails command to generate migration file $1 
	##	 "*_book*.*", "*_condition*.*", "*_media_type*.*", "*_purpose*.*".
	## The --force removes the old migration file and
	##             creates a new migration file.
	## The 1>/dev/null takes the number output to the screen and puts it the
	##   file /dev/null so no output is shown.
	## The rails creates a file in the format of (see below)
	##   yyyymmddhhmmss_create_$1.rb this becomes the orginalFile later.
	##
	#echo "2create_migration - "
	rails generate migration Create_$1 --force
	#1>/dev/null
	Errorcode=$?
	#echo -e "\npurpose - Errorcode = $Errorcode \n"
	#echo "------------------------------------------------"
}

_insert_into_migration()
{
	## Pass variable $1 = migrationFileName
	##
	## Part 1.
	##   Change to the db/migrate directory.
	##   Retrieve the empty migration file  save as orginalFile
	##		 "*_book*.*", "*_condition*.*", "*_media_type*.*", "*_purpose*.*".
	##   Copy the orignalFile to tempFileIn (this is the working file).
	## Part 2.
	##   Use the sed command to find the word that is passed to the function
	##	   _insert_into_migratin() $1 then look in file tempFileIn to find the
	##		 word $1 "book", "condition", "media_type", "purpose" then inserts
	##		 file *$1_fields.txt into the line after the word found. Then save
	##		 result of the mearged file into newFile.txt.
	## Part 3.
	##	 Move the newFile.txt to orginalFile replace the old orginalFile.
	##
	# migratePath="./db/migrate"
	cd ./db/migrate
	originalFile=$(ls *_${1}*.*)
	cp $originalFile tempFileIn

	#sed -e '/'${2}'/r '${migratePath}'/'${2}'_fields.txt' ${migratePath}/tempFileIn > ${migratePath}/newFile.txt
	sed -e '/'${1}'/r '${1}'_fields.txt' tempFileIn > newFile.txt
	#sed -e '/'${1}'/r '${1}'_fields.txt' originalFile > newFile.txt

	mv -f newFile.txt $originalFile

	# If you need you can add a question does this look good ?
	echo ""
	echo -e "**********************************************************************"
	echo -e "$1 migration file $originalFile created."
	echo -e "**********************************************************************\n"
	cat $originalFile
	cd ../..
}

_migrate_files()
{
	## Move back to my application directory
	## cd /home/don/workspace/books or by cd ../..


	echo -e "\n\n"
	echo -e "\t-------------------------------------------"
	echo -e "\tCreating tables using Migration file(s)...."
	echo -e "\t-------------------------------------------\n"
	rake -q db:migrate 2>/dev/null
	Errorcode=$?
	#echo -e "\nMigrate = Errorcode = $Errorcode \n"
	if [ $Errorcode == 1 ]; then
    echo "*************************"
    echo "* error code = $Errorcode        *"
    echo "* No data returned.     *"
    echo "*************************"
  fi
}

_remove_files()
{
	cd db/migrate
	echo -e "\n\tRemoving temporary working files.....\n"
	rm -v tempFileIn 					# a copy of original file.
	cd ../..
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
		migrationBuildName="Books"	# this need the "s" on the end of name
		migrationFileName="book"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName
		_migrate_files
		_remove_files
		;;

	2 )
		echo -e "\tCreating Migration for \"conditions\"....\n"
		#_create_conditions
		migrationBuildName="Conditions"
		migrationFileName="condition"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName
		_migrate_files
		_remove_files
		;;

	3 )
		echo -e "\tCreating Migration for \"media_types\"....\n"
		#_create_media_types
		migrationBuildName="Media_types"
		migrationFileName="media_type"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName
		_migrate_files
		_remove_files
		;;

	4 )
		echo -e "\tCreating Migration for \"purposes\"....\n"
		#_create_purposes
		migrationBuildName="Purposes"
		migrationFileName="purpose"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName
		_migrate_files
		_remove_files
		;;

	5 )
		echo -e "\tCreating Migration for \"book_types\"....\n"
		#_create_media_types
		migrationBuildName="Book_types"
		migrationFileName="book_type"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName
		_migrate_files
		_remove_files
		;;

	8 )
		# ------------------------------------------1-
		echo -e "\tCreating all Migrating for all tables....\n"
		#_create_books
		echo -e "\nBooks....."
		migrationBuildName="Books"
		migrationFileName="book"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName

		# ------------------------------------------2-
		# _create_conditions.
		echo -e "\nConditions....."
		migrationBuildName="Conditions"
		migrationFileName="condition"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName

		# ------------------------------------------3-
		# _create_media_types.
		echo -e "\nMedia_types....."
		migrationBuildName="Media_types"
		migrationFileName="media_type"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName

		# ------------------------------------------4-
		# _create_purposes.
		echo -e "\nPurposes....."
		migrationBuildName="Purposes"
		migrationFileName="purpose"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName

		# ------------------------------------------3-
		# _create_book_types.
		echo -e "\nBook_types....."
		migrationBuildName="Book_types"
		migrationFileName="book_type"

		_create_migration $migrationBuildName
		_insert_into_migration $migrationFileName

		# -------------------------------------------
		# migrate the migrate files to create the actual tables.
		echo -e "\nmigrating....."
		_migrate_files

		# remove all temporary.
		_remove_files
	;;

esac
exit

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
#            : 0.1.7  : Add the function _migrate_file              #
#            :        :   this will migrate the migrate files       #
#            :        :   to create the tables.                     #
#            :        : Last clean up.                              #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
