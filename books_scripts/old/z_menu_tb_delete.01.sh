#!/bin/bash
#
# Menu for deleting Tables.
# Using Mysql commands.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/workspace/books/bin/books_scripts/              #
# File Name : menu_tb_delete.sh                                     #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.6                                                 #
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

_are_you_sure()
{
  echo -en "\nAre you sure you want to Delete the Table (Y/n*) > "
  read Answer
  # Check to see if $Answer is empty
  if [ -z "$Answer" ]; then
    #echo "Answer is empty....."
    Answer="n"
  fi
}

_no_table_deleted()
{
  echo ""
  echo -e "************************"
  echo -e "*  No Tables Deleted.  *"
  echo -e "************************"
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

  echo -e "\t  Menu Delete Tables"
  echo -e "\t----------------------\n"
  echo -e "\t Name     Description"
  echo -e "\t------   -------------"
  echo -e "\t  1 - \tbooks using mysql.\n"
  echo -e "\t  2 - \tconditions using mysql.\n"
  echo -e "\t  3 - \tmedia_types using mysql.\n"
  echo -e "\t  4 - \tpurposes using mysql.\n\n"
  echo -e "\t  8 - \tall 4 tables above using mysql\n"
	echo -e "\t 99 - \tReturn to Main Menu."

  echo -en "\nEnter Selection ( 1 - 4, 8, 99 ) >> "
  read InputValue
  #echo -e "\n InputValue = $InputValue \n"

  # Check to see if $InputValue is empty
  if [ -z "$InputValue" ]; then
    #echo "InputValue is empty....."
    InputValue=100
  fi

  case $InputValue in
    1 )
      # call script "tb_delete_books_mysql.sh"
      clear
      echo -e "\n ***** Delete table books using Mysql ***** \n"
      _are_you_sure
      if [ $Answer = "Y" ]; then
        ./books_scripts/z_tb_delete_books_mysql.sh 
      else
        _no_table_deleted
      fi
      ;;

    2 )
      # call script "tb_delete_condition_mysql.sh"
      clear
      echo -e "\n ***** Delete table conditions using Mysql ***** \n"
      _are_you_sure
      if [ $Answer = "Y" ]; then
        ./books_scripts/z_tb_delete_conditions_mysql.sh
      else
        _no_table_deleted
      fi
      ;;

    3 )
      # call script "tb_delete_media_types_mysql.sh"
      clear
      echo -e "\n ***** Delete table media_types using Mysql ***** \n"
      _are_you_sure
      if [ $Answer = "Y" ]; then
        ./books_scripts/z_tb_delete_media_types_mysql.sh
      else
        _no_table_deleted
      fi
        ;;

    4 )
      # call script "tb_delete_purposes_mysqlsh"
      clear
      echo -e "\n ***** Delete table purposes using Mysql ***** \n"
      _are_you_sure
      if [ $Answer = "Y" ]; then
        ./books_scripts/z_tb_delete_purposes_mysql.sh
      else
        _no_table_deleted
      fi
      ;;

    8 )
      # call script "tb_delete_all_mysql.sh"
      clear
      echo -e "\n ***** Delete all 4 tables using Mysql ***** \n"
      _are_you_sure
      if [ $Answer = "Y" ]; then
        ./books_scripts/z_tb_delete_all_mysql.sh
      else
        _no_table_deleted
      fi
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
# 04/14/2020 : 0.0.1  : Original - Copyed from z_menu_tb_create.sh. #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.2  : Remove unneeded comment lines.              #
#            : 0.0.3  : Change section 3                            #
#            :        : from tb_delete_media_rails.sh               #
#            :        :  to  tb_delete_media_types_rails.sh.        #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.4  : Change section 4                            #
#            :        : from tb_delete_types_rails.sh               #
#            :        :  to  tb_delete_purposes_rails.sh.           #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.5  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.0.6  : Change path to relative path.               #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
