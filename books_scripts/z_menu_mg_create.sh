#!/bin/bash
#
# Menu for creating migration files.
# Using Mysql commands.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : menu_bg_create.sh                                     #
# Rev. Date : 04/22/2020                                            #
# Rev. No.  : 0.0.1                                                 #
# ----------------------------------------------------------------- #
#


#####################
##### Variables #####
#####################

InputValue=999              # Input from menu.
returnStatus=999            # Hold status of the previxe command.
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

while [ $InputValue -ne 99 ]
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
  
  echo -e "\tMenu Create Migration Files "
  echo -e "\t-------------------------------\n"
  echo -e "\t Name     Description"
  echo -e "\t------   -------------"
  echo -e "\t  1 - \tbooks using mysql.\n"
  echo -e "\t  2 - \tconditions using mysql.\n"
  echo -e "\t  3 - \tmedia_types using mysql.\n"
  echo -e "\t  4 - \tpurpose using mysql.\n\n"
  echo -e "\t  8 - \tall 4 tables above using mysql.\n"
  echo -e "\t 99 - \tReturn to Main Menu."
  
  #echo -e "\nEnd of list"

  echo -en "\nEnter Selection ( 1 - 4, 8, 99 ) >> "
  read InputValue
  
  case $InputValue in

    1|2|3|4|8 )
      # call script "tb_create_all_rails.sh"
      # and passing the variable $InputValue
      echo -e "\n ***** Create migration files... ***** \n"
      ./books_scripts/z_tb_create_all_rails.sh $InputValue
      returnStatus=$?
      #echo "returnStatus = $returnStatus"
      # this variable above is the return status from the above call script.

      #echo "1-returnStatus = $returnStatus"

      if [ $InputValue -eq 8 ]; then
        if [ $returnStatus -eq 0 ]; then
          echo -e "\n     ---->     All migration files created     ---->     Done"
          #echo "2-returnStatus = $returnStatus"
          #skipPrompt=1
          # this will sleep (pause) for 7 sec. then continue on.
          #sleep 7             # 7 sec. default.
          #break               # this will break out of the case statment
                              # then place you after the end case (esac).
        #else
        #  skipPrompt=0
        fi
      fi
      ;;

   99 )
      # Change text color to white.  #
      # Change text to bold.         #
      ##echo -en "$(tput setaf 1)"
      ##echo -e "$(tput bold)"
      ##echo -e "\n        Return to start_menu.sh."
      # Change background to blue 4,                           #
      # All the way to end of line.                            #
      # The above two lines needs to be combined into one line #
      #   this will remove the white line.                     #
      # Reset the colors back to the default.                  #
      #echo -e "$(tput setab 4)$(tput el)"
      ##echo -e "$(tput sgr0)"
      #skipPrompt=1
      exit 
      ;;

    * )
      # Change text color to Red 1. #
      # Change text to  bold.     #
      echo -en "$(tput setaf 1)"
      echo -e "$(tput bold)"
      echo -en "\n     Please enter a value ( 1 - 4, 8, 99 )\n\n"
      #InputValue=999
      #echo -e "$(tput setab 4)$(tput el)"
		  #echo -en "         Press Enter to continue"
		  #read 
      ;;

	esac

  if [ $InputValue -ne 99 ]; then
    # call function _press enter to continue.
    _press_enter
  fi

done
exit

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/22/2020 : 0.0.1  : Original - Copyed from z_menu_tb_create.sh. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
