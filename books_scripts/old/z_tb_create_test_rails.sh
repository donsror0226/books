#!/bin/bash
#
# ./books_scripts/z_tb_create_test_rails.sh
#

cd /home/don/workspace/books

echo -e "  Creating table test"
echo -e "-----------------------\n"

# this creates an empty "create_test" migration file 
rails generate migration CreateTest
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode \n"


rake db:migrate
#Errorcode=$?
#echo -e "\n errorcode = $Errorcode2 \n"

