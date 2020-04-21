#!/bin/bash
#
# Menu for create databases Books.
# Using Mysql commands and a Rake command.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : menu_db_create.sh                                     #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.4                                                 #
# ----------------------------------------------------------------- #
#

#####################
##### Variables #####
#####################

InputValue=999              # Input from menu.
Errorcode=0                 # Hold error code $?.
DB="Books"                  # Hold name of database.
DB1="books_developemnt"     # Hold name of database books_development.
DB2="books_production"      # Hold name of database books_production.
DB3="books_test"            # Hold name of database books_test.


#####################
##### Functions #####
#####################

_press_enter()
{
  echo -en "\nPress Enter to continue "
  read
  clear
}


########################
##### Main Program #####
########################

#cd /home/don/workspace/books

while [ $InputValue != "99" ]
do

  # Reset colors back to the default. #
  # Change background to blue 4,      #
  #   all the way to end of line.     #
  # All text will be in bold.         #
  # Change text color to Black 0.     #
  echo -e "$(tput sgr0)"
  #echo -e "$(tput setab 4)"
  #echo -e "$(tput el)"
  #echo -e "$(tput setaf 0)"
  #echo -e "$(tput bold)"
  clear

  echo -e "\t Menu Create databases"
  echo -e "\t-----------------------\n"
  echo -e "\t Name     Description"
  echo -e "\t------   -------------"
  echo -e "\t  1 - \t$DB's using mysql.\n"
  echo -e "\t  2 - \t$DB's using rake.\n"
	echo -e "\t 99 - \tReturn to Main Menu."

  echo -en "\nEnter Selection ( 1 - 2, 99 ) >> "
  read InputValue

  case $InputValue in
    1 )
      # call script "db_create_mysql.sh"
      echo -e "\n ***** Create databases using Mysql ***** \n"
      .books_scripts/z_db_create_mysql.sh
      ;;

    2 )
      # call script "db_create_rake.sh"
      echo -e "\n ##### Create databases using Rake #####"
      ./books_scripts/z_db_create_rake.sh
      ;;

   99 )
      # Change text color to white. #
      # Change text to bold.        #
      ##echo -en "$(tput setaf 1)"
      ##echo -e "$(tput bold)"
      ##echo -e "\n          Return to start_menu.sh."
      # Change background to blue 4,                           #
      # All the way to end of line.                            #
      # The above two lines needs to be combined into one line #
      #   this will remove the white line.                     #
      # Reset the colors back to the default.                  #
      #echo -e "$(tput setab 4)$(tput el)"
      ##echo -e "$(tput sgr0)"
      exit
      ;;

    * )
      # Change text color to Red 1. #
      # Change text to  bold.       #
      echo -en "$(tput setaf 1)"
      echo -e "$(tput bold)"
      echo -en "\n     Please enter a value ( 1 - 2, 99 )\n\n"
      InputValue=999
      #echo -e "$(tput setab 4)$(tput el)"
			#echo -en "         Press Enter to continue"
			#read 
      ;;
	esac

  # call function press enter to continue.
  _press_enter

done

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.1  : Original - Copyed from main.sh.             #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.2  : Remove unneeded comment lines.              #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.3  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.0.4  : Change path to relative path.               #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
