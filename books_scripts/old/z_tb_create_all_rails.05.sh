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
# Rev. Date : 04/24/2020                                            #
# Rev. No.  : 0.1.3                                                 #
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
migrationBuildName="none"		# Hold partial name of build migratiion Name.
														#   Book, Condition, media_type, Purpose.
migrationFileName="none"		# Hold partial name of migration file name.
														#   book, condition, media_type, purpose.
tableName="none"						# Hold partial name of table.
originalFile="none"					# Hold name of original file to work on.
fileIn="none"								# Hold a copy of original that will be worked on.

#####################
##### Functions #####
#####################

_create_books()
{
	echo -e "Creating table books "
	#rails generate migration CreateBook author:string{50} title:string{25} series_name:string{25} series_no:integer:unsigned isbn_tab_no:string{20} publisher:string{20} published_date:date location:string{20} price:decimal{5.2} purchase_date:date entry_date:date condition_id:integer{2} media_type_id:integer{2} purpose_id:integer{3}
	rails generate migration CreateBook
	Errorcode=$?
	#echo -e "books - Errorcode = $Errorcode \n"
}

_create_conditions()
{
	echo -e "Creating table conditions "

	#rails generate migration CreateCondition condition_id:integer{2} condition_name:string{10} 2>/dev/null
	rails generate migration CreateCondition
	Errorcode=$?
	#echo -e "condition - errorcode = $Errorcode \n"
}

_create_media_types()
{
	echo -e "Creating table media_types "

	#rails generate migration CreateMedia_type media_type_id:integer{2} media_type_name:string{15}
	rails generate migration CreateMedia_type
	Errorcode=$?
	#echo -e "media_type - Errorcode = $Errorcode \n"
}

_create_purposes()
{
	echo -e "Creating table purpose "

	#rails generate migration CreatePurpose purpose_id:integer{3} purpose_type:string{15} purpose_name:string{20}
	rails generate migration CreatePurpose
	Errorcode=$?
	#echo -e "purpose - Errorcode = $Errorcode \n"
}

_create_migration()
{
	# $1 = migrationBuildName, $2 = migrationFileName
	echo -e "Creating empty migration file...\n"
	#echo "1-migrationBuildName     = $ 1 = $1"
	#echo "1-migrationFileName = $ 2 = $2"

	#rails generate migration CreatePurpose purpose_id:integer{3} purpose_type:string{15} purpose_name:string{20}
	#rails generate migration CreatePurpose
	rails generate migration Create$1
	Errorcode=$?
	#echo -e "purpose - Errorcode = $Errorcode \n"
}

_insert_into_migration()
{
	# $1 = migrationBuildName, $2 = migrationFileName
	# echo -e "\nGet empty migration file...\n"
	# echo "2-migrationBuildName     = $ 1 = $1"
	# echo "2-migrationFileName = $ 2 = $2"
	# echo "-"
	# ls ./db/migrate/*_${2}*.*
	# echo "-"

	# Holds the basic file name of the migration file = 
	#		"*_book*.*", "*_condition*.*", "*_media_type*.*", "*_purpose*.*"
	originalFile=$(ls ./db/migrate/*_${2}*.*)
	cp $originalFile fileIn
	echo "fileIn = $fileIn"


	# Copy basic migration file to tempfileIn
	cp $fileIn ./db/migrate/tempFileIn
	# echo "--"
	# ls ./db/migrate/temp*
	#echo "tempFileIn = "
	#cat ./db/migrate/tempFileIn
	#echo "--"

	# echo ""
	# echo "           Original files"
	# echo "===================================="
	# echo "fileIn = "
	# cat $fileIn
	# echo "===================================="
	# echo "tempFileIn = "
	# cat ./db/migrate/tempFileIn
	# echo "===================================="
	# #echo "second_file.txt= "
	# #cat ./db/migrate/second_file.txt
	# echo "${2}_fields.txt = "
	# cat ./db/migrate/${2}_fields.txt
	# echo ""
	# echo "===================================="
	# echo ""
	# _press_enter

	# echo "------------------------------------"
	# echo "$ 2 = ${2}"
	# echo "results from command sed.."
	#sed -e '/${2}/r ./db/migrate/tempFileIn' ./db/migrate/second_file.txt
	#sed -e '/${2}/r ./db/migrate/second_file.txt' ./db/migrate/tempFileIn
	# works in place display only.

	# echo "1**"
	# echo "          sed #1"
	# # display result of sed on screen.
	# #sed -e '/book/r ./db/migrate/second_file.txt' ./db/migrate/tempFileIn
	# #echo "!!!!!!!!!!"
	# sed -e '/book/r ./db/migrate/'${2}'_fields.txt' ./db/migrate/tempFileIn
	# # echo "**"
	# _press_enter

	# echo "2**"
	# echo "          sed #2"
	# # places result of sed in varialbe in result.
	# #result=$(sed -e '/book/r ./db/migrate/second_file.txt' ./db/migrate/tempFileIn)
	# result=$(sed -e '/book/r ./db/migrate/'${2}'_fields.txt' ./db/migrate/tempFileIn)
	# #sed -e '/bar/r./first_file.txt' second_file.txt
	# #sed -i -e '/pattern/r filetoinsert' filetobeinserted
	# #sed -i '/PATTERN/r file1' file2
	# #sed '/! comment/ r insertfile' destinationfile
	# echo ""
	# # display result as one line.
	# echo "result = "
	# echo $result
	# echo "**"
	# _press_enter

	# #echo ""
	# #echo "2.5**"
	# #echo "          sed #2.5"
	# #places result of sed in varialbe in result.
	#sed -e '/book/r ./db/migrate/second_file.txt' ./db/migrate/tempFileIn 1>/dev/null
	#sed -e '/book/r ./db/migrate/'${2}'_fields.txt' ./db/migrate/tempFileIn 
	#sed -e '/book/r ./db/migrate/'${2}'_fields.txt' ./db/migrate/tempFileIn 1>/dev/null
	# echo ""
	# echo "1-ls = "
	# #ls ./db/migrate/new*.*
	# Find the word "book" in file tempFileIn then insert ${2}_fields.txt
	#   after this line, then place the merged file in newFile.txt.
	sed -e '/book/r ./db/migrate/'${2}'_fields.txt' ./db/migrate/tempFileIn > ./db/migrate/newFile.txt
	# #echo "2-ls = "
	# #ls ./db/migrate/new*.*
	#sed -e '/bar/r./first_file.txt' second_file.txt
	#sed -i -e '/pattern/r filetoinsert' filetobeinserted
	#sed -i '/PATTERN/r file1' file2
	#sed '/! comment/ r insertfile' destinationfile
	# #echo ""
	# #echo "newFile.txt = "
	# #cat ./db/migrate/newFile.txt
	# #echo "**"
	# #echo ""
	# #_press_enter

	# echo "3**"
	# echo "          sed #3"
	# # place result of sed on screen and in file newFile.txt.
	# # sed -e '/book/r ./db/migrate/second_file.txt' ./db/migrate/tempFileIn > ./db/migrate/newFile.txt
	# echo "1-ls "
	# ls ./db/migrate/new*.*
	# echo "sed command "
	# sed -e '/book/r ./db/migrate/'${2}'_fields.txt' ./db/migrate/tempFileIn > ./db/migrate/newFile.txt
	# echo "2-ls "
	# ls ./db/migrate/new*.*
	# cat ./db/migrate/newFile.txt
	# echo "**"
	# _press_enter

	#echo "4**"
	#echo "newFile.txt = "
	# Copy 
	# Copy newFile.txt to newFile.rb
	echo ""
	cp ./db/migrate/newFile.txt ./db/migrate/newFile.rb
	echo " These 3 lins are not needed."
	echo "   This is a cat of file newfile.rb."
	cat ./db/migrate/newFile.rb
	#echo "**"
	_press_enter
	#echo ""
	#echo "------------------------------------"

}

_remove_files()
{
	echo -e "\tRemoving temperary working files.....\n"
	rm -v ./db/migrate/newFile.txt 					# output of sed working file.
	rm -v ./db/migrate/tempfileIn 					# 
	rm -v ./db/migrate/newFile.rb						# copy output file to original file.
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
#echo -e "Varialbe passed = $1 \n"

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
		;;

	3 )
		echo -e "\tCreating Migration for \"media_types\"....\n"
		#_create_media_types
		;;

	4 )
		echo -e "\tCreating Migration for \"purposes\"....\n"
		#_create_purposes
		;;

	8 )
		echo -e "\tCreating all Migrating for all tables....\n"
		#_create_books
		#_create_conditions
		#_create_media_types
		#_create_purposes
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
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
