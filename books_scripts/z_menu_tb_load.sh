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
# Rev. Date : 05/04/2020                                            #
# Rev. No.  : 0.1.2                                                 #
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
Uname="dondb"
Pword="dps0226db"
loadTable="none"            # Hold partial name of table(s) you want to load.
letterS=""                  # Holds "s" if loadTable is "all" other wise "".


#####################
##### Functions #####
#####################

_load_all()
{
  # $1 = loadTable
  #echo "loadTable = $ 1 = $1"

  # if [ $1 == "all" ]; then
  #   letterS="s"
  # else
  #   letterS=""
  # fi

  echo -e "\n***** Loading $1 table$letterS using Mysql.... *****\n"

  mysql -u ${Uname} -p${Pword} < ./sql_commands/tb_load_${1}.sql 2>/dev/null
  ERRORCODE=$?
  #echo "1.1-ERRORCODE = $ERRORCODE"
}

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
  echo -e "\t  3 - \tpurposes using mysql.\n"
  echo -e "\t  4 - \tbook_types using mysql.\n\n"
  echo -e "\t  8 - \tall 4 tables above using mysql\n"
	echo -e "\t 99 - \tReturn to Main Menu."

  echo -en "\nEnter Selection ( 1 - 4, 8, 99 ) >> "
  read InputValue
  #echo -e "\n InputValue = $InputValue \n"

  # Check to see if $InputValue is empth
  if [ -z "$InputValue" ]; then
    #echo "InputValue is empty....."
    InputValue=100
  fi

  case $InputValue in
    1 )
      loadTable="conditions"
      # passing variables $loadTable parital names.
      _load_all $loadTable
      ;;

    2 )
      loadTable="mediatypes"
      # passing variables $loadTable parital names.
      _load_all $loadTable
      ;;

    3 )
      loadTable="purposes"
      # passing variables $loadTable parital names.
      _load_all $loadTable
      ;;

    4 )
      loadTable="booktypes"
      # passing variables $loadTable parital names.
      _load_all $loadTable
      ;;

    8 )
      loadTable="all"
      # passing variables $loadTable parital names.
      _load_all $loadTable
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
# 04/21/2020 : 0.1.0  : Move section 8 to a function _load_all.     #
#            :        : Remove info from section 1 to 3.            #
#            :        : Add variable to pass to _load_all,          #
#            :        :   and call function _load_all.              #
#            : 0.1.1  : Remove unneeded code. Cleanup.              #
# ----------------------------------------------------------------- #
# 05/04/2020 : 0.1.2  : Add section 4 to load book_types.           #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
