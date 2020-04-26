#!/bin/bash
#
# Menu for creating Tables.
# Using Mysql commands.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/books_scripts/              #
# File Name : menu_tb_create.sh                                     #
# Rev. Date : 04/18/2020                                            #
# Rev. No.  : 0.0.8                                                 #
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
  
  echo -e "\t Menu Create Tables "
  echo -e "\t--------------------\n"
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
      echo -e "\n ***** Create all tables ***** \n"
      ./books_scripts/z_tb_create_all_rails.sh $InputValue
      #returnStatus=$?
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
      #exit 
      break
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
# 04/13/2020 : 0.0.1  : Original - Copyed from main.sh.             #
# ----------------------------------------------------------------- #
# 04/14/2020 : 0.0.2  : Add section 9 create all 4 tables.          #
# ----------------------------------------------------------------- #
# 04/15/2020 : 0.0.3  : Remove unneeded comment lines.              #
#            : 0.0.4  : Change section 3                            #
#            :        : from tb_create_media_rails.sh               #
#            :        :  to  tb_create_media_type_rails.sh.         #
#            :        : Change table media to table media_type.     #
# ----------------------------------------------------------------- #
# 04/16/2020 : 0.0.5  : Change section 4                            #
#            :        : from tb_create_type_rails.sh                #
#            :        :  to  tb_create_purpose_rails.sh.            #
#            :        : Change table type to table purpose.         #
# ----------------------------------------------------------------- #
# 04/18/2020 : 0.0.6  : Changed path location of scripts            #
#            :        :   from /home/don/bin/books_scripts/         #
#            :        :   to                                        #
#            :        :   /home/don/workspace/books/books_scripts/. #
#            : 0.0.7  : Remove section 1 - 4.                       #
#            :        : Add $InputValue to the end of section 8     #
#            :        :   command to pass the value of $InputValue. #
#            :        : Change section 8 case from 8 to 1|2|3|4|6.  #
#            : 0.0.8  : Change path to relative path.               #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
