#!/bin/bash
#
# Start menu for 
#   create and delete Databases Books,
#   create and delete and load tables.
# Using Mysql commands and a Rake command.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : z_menu.sh                                             #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.10                                                #
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
  #echo "2 InputValue = $InputValue"
  clear
}

_are_you_sure()
{
  echo -en "\nAre you sure you want to Delete the Databases (Y/n*) > "
  read  Answer
  # Check to see if $Answer is empty
   if [ -z "$Answer" ]; then
    #echo "Answer is empty....."
    Answer="n"
  fi
}


########################
##### Main Program #####
########################

cd /home/don/workspace/books
clear

while [ $InputValue != "99" ]
do

  # Reset colors back to the default. #
  # Change background to blue 4,      #
  #   all the way to end of line.     #
  # All text will be in bold.       #
  # Change text color to Black 0.   #
  echo -e "$(tput sgr0)"
  #echo -e "$(tput setab 4)"
  #echo -e "$(tput el)"
  #echo -e "$(tput setaf 0)"
  #echo -e "$(tput bold)"
  clear
  #echo -e "\nList of Script Files in bin Dir.\n"
  
  echo -e "\t\t      Main Menu"
  echo -e "\t\t    -------------\n"
  echo -e "\t Name     Description     < Database = $DB1 >"
  echo -e "\t------   -------------   ----------------------------------"
  echo -e "\t  1 - \tMenu - Create databases using mysql.\n"
  echo -e "\t  2 - \tDelete databases using mysql.\n"
  echo -e "\t  3 - \tGrant access to databases using mysql.\n"
  echo -e "\t  4 - \tShow all databases using mysql.\n"
  echo -e "\t  5 - \tMenu - Create tables using mysql.\n"
  echo -e "\t  6 - \tMenu - Load tables using mysql.\n"
  echo -e "\t  7 - \tMenu - Delete tables using mysql.\n"
  echo -e "\t  8 - \tShow all tables.\n"
	echo -e "\t 99 - \tExit Program."
  echo -en "\nEnter Selection ( 1 - 8, 99 ) >> "
  read InputValue
  ##echo -e "\n 0 InputValue = $InputValue \n"
  
  case $InputValue in
    1 )
      # call script "menu_db_create.sh"
      echo -e "\n ***** Menu Create Databases ***** \n"
      ./books_scripts/z_menu_db_create.sh
      ;;

    2 )
      # call script "db_delete_mysql.sh"
      echo -e "\n %%%%% Delete databases using Mysql %%%%% \n"
      _are_you_sure
      if [ $Answer == "Y" ]; then
        echo "Deleting books_ Databases."
        ./books_scripts/z_db_delete_mysql.sh
      else
        echo -e ""
        echo -e "\t***************************"
        echo -e "\t*  Databases Not Deleted  *"
        echo -e "\t***************************\n"
      fi
      ;;

    3 )
      # call script "db_grant_mysql.sh"
      echo -e "\n ===== Grant privileges using Mysql ====="
      ./books_scripts/z_db_grant_mysql.sh
      ;;

    4 )
      # call script "db_show_mysql.sh"
      echo -e "\n ===== Show all databases using Mysql ====="
      ./books_scripts/z_db_show_mysql.sh
      ;;

    5 )
      # call script "menu_tb_create.sh"
      echo -e "\n ===== Call menu tb create ====="
      ./books_scripts/z_menu_tb_create.sh
      ;;

    6 )
      # call script "menu_tb_load.sh"
      echo -e "\n ===== Call menu tb load ====="
      ./books_scripts/z_menu_tb_load.sh
      ;;

    7 )
      # call script "menu_tb_delete.sh"
      echo -e "\n ===== Call menu tb delete ====="
      ./books_scripts/z_menu_tb_delete.sh
      ;;

    8 )
      # call script "tb_show_all_mysql.sh"
      echo -e "\n ===== Show all tables using Mysql ====="
      ./books_scripts/z_tb_show_all_mysql.sh
       ;;

   99 )
      # Change text color to white. #
      # Change text to bold.        #
      echo -en "$(tput setaf 1)"
      echo -e "$(tput bold)"
      echo -e "\n          Exiting Program."
      # Change background to blue 4,                           #
      # All the way to end of line.                            #
      # The above two lines needs to be combined into one line #
      #   this will remove the white line.                     #
      # Reset the colors back to the default.                  #
      #echo -e "$(tput setab 4)$(tput el)"
      echo -e "$(tput sgr0)"
      #exit
      break
      ;;

    * )
      # Change text color to Red 1. #
      # Change text to  bold.       #
      echo -en "$(tput setaf 1)"
      echo -e "$(tput bold)"
      echo -en "\n     Please enter a value ( 1 - 7, 99 )\n\n"
      InputValue=999
      #echo -e "$(tput setab 4)$(tput el)"
			#echo -en "         Press Enter to continue"
			#read 
      ;;
	esac

  #echo "z_menu.sh ---> $InputValue"
  # Need the Menu options below.
  if [ $InputValue != 1 ] &&
     [ $InputValue != 5 ] &&
     [ $InputValue != 6 ] &&
     [ $InputValue != 7 ]; then
    # call function press enter to continue.
    _press_enter
  fi

done
exit

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/09/2020 : 0.0.1  : Original - copyed from main.sh.             #
# ----------------------------------------------------------------- #
# 04/10/2020 : 0.0.2  : Added option 2 & 3.                         #
#            :        : (2) Add delete the three books databases.   #
#            :        : Using mysql.                                #
#            :        : (3) Add create the three books databases.   #
#            :        : Using Rake.                                 #
# ----------------------------------------------------------------- #
# 04/11/2020 : 0.0.3  : Move option 3 to option 4 in menu.          #
#            :        : Add option 3 to menu. Show all databases.   #
#            :        : Using mysql.                                #
# ----------------------------------------------------------------- #
# 04/12/2020 : 0.0.4  : Move option 4 to option 5.                  #
#            :        : Add new option 4 grant privileges to the    #
#            :        : three books databases using mysql.          #
# ----------------------------------------------------------------- #
# 04/13/2020 : 0.0.5  : Move option 5 to option 50.                 #
#            :        : Add option 5 create table books.            #
#            :        : Using rails.                                #
#            : 0.0.6  : Add option 6 to delete table books.         #
#            :        : Using mysql.                                #
#            : 0.0.7  : Break create tb into submenu.               #
# ----------------------------------------------------------------- #
# 04/14/2020 : 0.0.8  : Break delete tb into submenu.               #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.9  : Add section 7 show tables using mysql.      #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.10 : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.0.11 : Change path to relative path.               #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
