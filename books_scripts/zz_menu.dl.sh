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
# File Name : zz_menu.dl.sh                                         #
# Rev. Date : 04/29/2020                                            #
# Rev. No.  : 0.0.43                                                 #
# ----------------------------------------------------------------- #
#

#####################
##### Variables #####
#####################

InputValue=999              # Input from menu.
Errorcode=0                 # Hold error code $?.
Answer="n"                  # Hold Answer to question default "n".
choice=0                    # Hold copy of the selected item from the dialog.
tempfile=$(mktemp temp-dps.XXX) # A temperay file use to
                            # Hold the selected item from the dialog (menu).

DB="Books"                  # Hold name of database.
DB1="books_developemnt"     # Hold name of database books_development.
DB2="books_production"      # Hold name of database books_production.
DB3="books_test"            # Hold name of database books_test.
DIALOG=${DIALOG=dialog}     # Hold dialog command name.



#####################
##### Functions #####
#####################

_remove_temp_files()
{
  echo -e "\nRemoveing temp files....\n"
  rm -v *-dps.*
}

## ----------------------------------------------
_press_enter()
{
  echo -en "\nPress Enter to continue "
  read
  ##clear
}

## ----------------------------------------------
_are_you_sure()
{
  echo -en "\nAre you sure you want to Delete the Databases (Y/n*) > "
  read  Answer
  ## Check to see if $Answer is empty
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
  # All text will be in bold.         #
  # Change text color to Black 0.     #
  echo -e "$(tput sgr0)"
  #echo -e "$(tput setab 4)"
  #echo -e "$(tput el)"
  #echo -e "$(tput setaf 0)"
  #echo -e "$(tput bold)"
  clear
  #echo -e "\nList of Script Files in bin Dir.\n"
  
  # echo -e "\t\t      Main Menu"
  # echo -e "\t\t    -------------\n"
  # echo -e "\t Name     Description     < Database = $DB1 >"
  # echo -e "\t------   -------------   ----------------------------------"
  # echo -e "\t  1 - \tMenu - Create databases using mysql.\n"
  # echo -e "\t  2 - \tDelete databases using mysql.\n"
  # echo -e "\t  3 - \tGrant access to databases using mysql.\n"
  # echo -e "\t  4 - \tShow all databases using mysql.\n"
  # echo -e "\t  5 - \tMenu - Create tables using mysql.\n"
  # echo -e "\t  6 - \tMenu - Load tables using mysql.\n"
  # echo -e "\t  7 - \tMenu - Delete tables using mysql.\n"
  # echo -e "\t  8 - \tShow all tables.\n"
	# echo -e "\t 99 - \tExit Program."
  # echo -en "\nEnter Selection ( 1 - 8, 99 ) >> "
  # read InputValue
  ##echo -e "\n 0 InputValue = $InputValue \n"

  # This section works.
  # DIALOG=${DIALOG=dialog}
  # tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
  # trap "rm -f $tempfile" 0 1 2 5 15
  # $DIALOG --backtitle "Select your favorite singer" \
  # 	--title "My favorite singer" --clear \
  #         --radiolist "Hi, you can select your favorite singer here  " 20 61 5 \
  #         "Rafi"  "Mohammed Rafi" off \
  #         "Lata"    "Lata Mangeshkar" ON \
  #         "Hemant" "Hemant Kumar" off \
  #         "Dey"    "MannaDey" off \
  #         "Kishore"    "Kishore Kumar" off \
  #         "Yesudas"   "K. J. Yesudas" off  2> $tempfile
  # retval=$?
  # echo "retval = $retval"
  # choice=`cat $tempfile`
  # echo "choice = $choice"

  # This section works.
  # DIALOG=${DIALOG=dialog}
  ## old way of creating a temp file.
  # tempfile1=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
  ## new way of creating a temp file.
  # tempfile=$(mktemp temp-dps.XXX)
  ## retval = 
  ##   0 - ok button pressed.
  ##   1 - cancel/exit button pressed or ctrl-c.
  ##   2 - 
  ##   5 - 
  ##  15 - 
  ## 255 - Esc button pressed.
  ## ----------------------------
  ## the --cancel-label "xxx" = 
  ##  changes the button name from cancel to exit in this case.
  ## ----------------------------
  ## this will remove files on errors
  trap "rm -f $tempfile" 0 1 2 5 15
  #$DIALOG --backtitle "Book Inventory" \
  dialog --backtitle "Book Inventory" \
	  --title "Main Menu" \
    --cancel-label "Exit" \
    --radiolist "Enter Selection" 20 61 8 \
      "1"  "Menu - Create databases using mysql." off \
      "2"  "Delete databases using mysql." off \
      "3"  "Grant access to databases using mysql." off \
      "4"  "Show all databases using mysql." off \
      "5"  "Menu - Create tables using mysql." off \
      "6"  "Menu - Load tables using mysql." off \
      "7"  "Menu - Delete tables using mysql." off \
      "8"  "Show all tables." off 2> $tempfile

  retval=$?
  #echo "retval = '$retval'"
  #cat $tempfile
  choice=`cat $tempfile`
  #echo "choice = '$choice'"
  #_remove_temp_files

  ## when cancel/exit or exc button pressed
  ## choice is equal to "" null, it is converts to a 0.
  ## otherwise places choice into InputValue.
  ## this line uses the expr command.
  #InputValue=$(( choice ))

  ## the above line of code can be writen as this
  ## to make it more readable.
  ## check to see off cancel/exit or esc botton pressed.
  if [ $retval == 1 ] || [ $retval == 255 ]; then
    # # ---------------------------------------- # 
    # if [ $retval == 1 ]; then                  # this section not needed.
    #   echo "---> Cancel/Exit button pressed."  # 
    # else                                       # info only.
    #   echo "---> Esc button pressed."          #
    # fi                                         #
    # # ---------------------------------------- #
    choice=99
  fi
  InputValue=$choice

  case $InputValue in

    1 )
      ## Call script "menu_db_create.sh"
      echo -e "\n ***** Menu Create Databases ***** \n"
      ./books_scripts/z_menu_db_create.sh
      ;;

    2 )
      ## Call script "db_delete_mysql.sh"
      echo -e "\n %%%%% Delete databases using Mysql %%%%% \n"
      _are_you_sure
      if [ $Answer == "Y" ]; then
        echo "---> Deleting books_ Databases."
        ./books_scripts/z_db_delete_mysql.sh
      else
        echo -e ""
        echo -e "\t***************************"
        echo -e "\t*  Databases Not Deleted  *"
        echo -e "\t***************************\n"
      fi
      ;;

    3 )
      ## Call script "db_grant_mysql.sh"
      echo -e "\n ===== Grant privileges using Mysql ====="
      ./books_scripts/z_db_grant_mysql.sh
      ;;

    4 )
      ## Call script "db_show_mysql.sh"
      echo -e "\n ===== Show all databases using Mysql ====="
      ./books_scripts/z_db_show_mysql.sh
      ;;

    5 )
      ## Call script "menu_tb_create.sh"
      echo -e "\n ===== Call menu tb create ====="
      ./books_scripts/z_menu_tb_create.sh
      ;;

    6 )
      ## Call script "menu_tb_load.sh"
      echo -e "\n ===== Call menu tb load ====="
      ./books_scripts/z_menu_tb_load.sh
      ;;

    7 )
      ## Call script "menu_tb_delete.sh"
      echo -e "\n ===== Call menu tb delete ====="
      ./books_scripts/z_menu_tb_delete.sh
      ;;

    8 )
      ## Call script "tb_show_all_mysql.sh"
      echo -e "\n ===== Show all tables using Mysql ====="
      ./books_scripts/z_tb_show_all_mysql.sh
       ;;

   99|0 )
      ## Cancel/Exit button or esc button pressed
      clear
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

    # This section is no longer needed.
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

  ## Need for the Menu options.
  if [ $InputValue != 1 ] &&
     [ $InputValue != 5 ] &&
     [ $InputValue != 6 ] &&
     [ $InputValue != 7 ] ; then
    ## Call function press enter to continue.
    _press_enter
  fi

done

## Call function remove temp files.
## this will remove all temp file that where used.
_remove_temp_files
exit

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/27/2020 : 0.0.1  : Original - copyed from z_main.sh.           #
# ----------------------------------------------------------------- #
# 04/28/2020 : 0.0.2  : Added option dialog                         #
#            :        : to create menu.                             #
#            : 0.0.3  : Added function _remove_temp_files.          #
# ----------------------------------------------------------------- #
# 04/29/20   : 0.0.4  : Remove unneeded code and comments.          #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
