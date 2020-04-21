#!/bin/bash
#
# Menu for loading tables.
# Using Mysql commands.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : menu_tb_load.sh                                       #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.3                                                 #
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
Answer="n"                  # Hold Answer to question default "n".


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

  echo -e "\t  Menu Load Tables"
  echo -e "\t--------------------\n"
  echo -e "\t Name     Description"
  echo -e "\t------   -------------"
  echo -e "\t  1 - \tconditions using mysql.\n"
  echo -e "\t  2 - \tmedia_types using mysql.\n"
  echo -e "\t  3 - \tpurposes using mysql.\n\n"
  echo -e "\t  8 - \tall 3 tables above using mysql\n"
	echo -e "\t 99 - \tReturn to Main Menu."

  echo -en "\nEnter Selection ( 1 - 3, 8, 99 ) >> "
  read InputValue
  #echo -e "\n InputValue = $InputValue \n"

  # Check to see if $InputValue is empth
  if [ -z "$InputValue" ]; then
    #echo "InputValue is empty....."
    InputValue=100
  fi

  case $InputValue in
    1 )
      # call script "tb_load_condition_mysql.sh"
      echo -e "\n ***** Load table conditions using Mysql ***** \n"
      ./books_scripts/z_tb_load_conditions_mysql.sh
      echo -e "\n   Loading ....>       .... Done.\n"
      ;;

    2 )
      # call script "tb_load_media_types_mysql.sh"
      echo -e "\n ***** Load table media_types using Mysql ***** \n"
      ./books_scripts/z_tb_load_media_types_mysql.sh
      echo -e "\n   Loading ....>       .... Done.\n"
      ;;

    3 )
      # call script "tb_load_types_mysqlsh"
      echo -e "\n ***** Load table purposes using Mysql ***** \n"
      ./books_scripts/z_tb_load_purposes_mysql.sh
      echo -e "\n   Loading ....>       .... Done.\n"
      ;;

    8 )
      # call script "tb_load_all_mysql.sh"
      echo -e "\n ***** Load all 3 tables using Mysql ***** \n"
      ./books_scripts/z_tb_load_all_mysql.sh
      echo -e "\n   Loading ....>       .... Done.\n"
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
      echo -en "\n     Please enter a value ( 1 - 4, 8, 99 )\n\n"
      InputValue=999
      #echo -e "$(tput setab 4)$(tput el)"
			#echo -en "         Press Enter to continue"
			#read 
            ;;
	esac

	# call function _press enter to continue.
	_press_enter

done

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.2  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.0.3  : Change path to relative path.               #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
