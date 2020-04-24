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
# File Name : z_tb_create_books_all.sh                              #
# Rev. Date : 04/22/2020                                            #
# Rev. No.  : 0.1.10                                                #
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


#####################
##### Functions #####
#####################

_create_books()
{
	echo -e "Creating table books "
	rails generate migration CreateBook author:string{50} title:string{25} series_name:string{25} series_no:integer:unsigned isbn_tab_no:string{20} publisher:string{20} published_date:date location:string{20} price:decimal{5.2} purchase_date:date entry_date:date condition_id:integer{2} media_type_id:integer{2} purpose_id:integer{3}
	Errorcode=$?
	#echo -e "books - Errorcode = $Errorcode \n"
}

_create_conditions()
{
	echo -e "Creating table conditions "

	rails generate migration CreateCondition condition_id:integer{2} condition_name:string{10} 2>/dev/null
	Errorcode=$?
	#echo -e "condition - errorcode = $Errorcode \n"
}

_create_media_types()
{
	echo -e "Creating table media_types "

	rails generate migration CreateMedia_type media_type_id:integer{2} media_type_name:string{15}
	Errorcode=$?
	#echo -e "media_type - Errorcode = $Errorcode \n"
}

_create_purposes()
{
	echo -e "Creating table purpose "

	rails generate migration CreatePurpose purpose_id:integer{3} purpose_type:string{15} purpose_name:string{20}
	Errorcode=$?
	#echo -e "purpose - Errorcode = $Errorcode \n"
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
		_create_books
		;;

	2 )
		echo -e "\tCreating Migration for \"conditions\"....\n"
		_create_conditions
		;;

	3 )
		echo -e "\tCreating Migration for \"media_types\"....\n"
		_create_media_types
		;;

	4 )
		echo -e "\tCreating Migration for \"purposes\"....\n"
		_create_purposes
		;;

	8 )
		echo -e "\tCreating all Migrating for all tables....\n"
		_create_books
		_create_conditions
		_create_media_types
		_create_purposes
		;;

   * )
    # Change text color to Red 1. #
    # Change text to  bold.       #
    echo -en "$(tput setaf 1)"
    echo -e "$(tput bold)"
    echo -e "\n     Entered wrong value ($1) try agin. )\n\n"
    #echo -e "$(tput setab 4)$(tput el)"
		echo -en "         Press Enter to continue"
		read
		exit
    ;;
esac

#echo -e "\n 0a-Errorcode =  $Errorcode \n"
#if [ $Errorcode -ne 0 ]; then
	echo -e "\n\n"
	echo -e "\t-----------------------------------------------"
	echo -e "\tCreating all tables using Migration file(s)...."
	echo -e "\t-----------------------------------------------\n"
	rake db:migrate
	Errorcode=$?
	#echo -e "\n 0-errorcode = $Errorcode \n"
#fi
exit $Errorcode

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
# 04/22/2020 : 0.1.2  : Rename this program from                    #
#            :        :   z_tb_create_all_rails.sh to               #
#            :        :   z_mg_create_all_rails.sh.                 #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
