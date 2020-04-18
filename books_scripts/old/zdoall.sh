#!/bin/bash
#
# Menu to delete, create, load, & show all tables.
# At one time.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/bin/books_scripts/                          #
# File Name : zdoall.sh                                             #
# Rev. Date : 04/17/2020                                            #
# Rev. No.  : 0.0.1                                                 #
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
  echo -en "\nAre you sure you want to Delete all tables (Y/n*) > "
  read  Answer
  # Check to see if $Answer is empth
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

cd /home/don/workspace/books

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
    
  echo -e "\t        Do All"
  echo -e "\t    --------------\n"
  echo -e "\t Name     Description"
  echo -e "\t------   -------------"
  echo -e "\t  1 - \tRun Delete all tables.\n"
  echo -e "\t    - \t    Create all tables.\n"
  echo -e "\t    - \t    Load all tables.\n"
  echo -e "\t    - \t    Show all tables.\n"
	echo -e "\t 99 - \tExit Program."
  echo -en "\nEnter Selection ( 1, 99 ) >> "
  read InputValue
  ##echo -e "\n 0 InputValue = $InputValue \n"

  # Check to see if $InputValue is empty
  if [ -z "$InputValue" ]; then
    #echo "InputValue is empty....."
      nputValue=100
  fi
    
  if [ $InputValue = 1 ]; then
    _are_you_sure
  fi

  case $InputValue in
    1 )
      clear
      echo -e "\n ***** Delete all table using Mysql ***** \n"
      _are_you_sure
      if [ $Answer = "Y" ]; then
        echo -e "\n ***** Deleting all tables ***** \n"
        /home/don/bin/books_scripts/z_delete_all_mysql.sh
        echo -e "\n ***** Creating all tables ***** \n"
        /home/don/bin/books_scripts/z_tb_create_books_all.sh
        echo -e "\n ***** loading all tables ***** \n"
        /home/don/bin/books_scripts/z_tb_load_all_mysql.sh
        echo -e "\n ***** Show all tables ***** \n"
        /home/don/bin/books_scripts/z_tb_delete_all_mysql.sh
        echo -e "\n ***** All Done ***** \n"
      else
        _no_table_deleted
      fi
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
      exit
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

    # call function press enter to continue.
    _press_enter

done

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 04/17/2020 : 0.0.1  : Orginal - copyed from main.sh.              #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
