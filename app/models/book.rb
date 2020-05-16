#!/bin/bash
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/app/models/                 #
# File Name : book.rb                                               #
# Rev. Date : 05/13/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

class Book < ApplicationRecord
	#belongs_to :condition
	#belongs_to :mediatype
	#belongs_to :purpose
	#belongs_to :booktype

	# --------------------------------------------------------------- #
	# -- Author                                                       #
	# -- Error 01 - Invalid no data in field.                         #
	# -- Error 02 - Greater than 50 char.                             #
	# --------------------------------------------------------------- #
	validates_presence_of :author,
												:message => 
												 " -------> Error 01 - Field Blank."
	validates_length_of :author,
											:maximum => 50,
											:message =>
											 " -------> Error 02 - Greater than 50 char."

	# --------------------------------------------------------------- #
	# -- Title                                                        #
	# -- Error 03 - Invalid no data in field.                         #
	# -- Error 04 - Greater than 25 char.                             #
	# --------------------------------------------------------------- #
	validates_presence_of :title,
												:message => 
												 " ----------> Error 03 - Field Blank."
	validates_length_of :title,
											:maximum => 50,
											:message =>
											 " ----------> Error 04 - Greater than 25 char."

	# --------------------------------------------------------------- #
	# -- Series Name                                                  #
	# -- Error 05 - Greater than 25 char.                             #
	# --------------------------------------------------------------- #
	validates_length_of :series_name,
											:maximum => 25,
											:message =>
											 " -------> Error 05 - Greater than 50 char."

	# --------------------------------------------------------------- #
	# -- Series No.                                                   #
	# -- Error 06 - Value must be 1 - 1oo.                            #
	# -- Error 07 - Value not numeric.                                #
	# --------------------------------------------------------------- #
	validates_inclusion_of :series_no,
												 :within => 1..100,
												 :allow_nil => true,
												 :message => 
												  " -------> Error 06 - Value must be 1 - 100."
	validates_numericality_of :series_no,
														:allow_nil => true,
														:message =>
											 			 " -------> Error 07 - Value not numeric."

	# --------------------------------------------------------------- #
	# -- ISBN - Tab No.                                               #
	# -- Error 08 - Invalid no data in field.                         #
	# -- Error 09 - Greater than 20 char.                             #
	# --------------------------------------------------------------- #
	validates_presence_of :isbn_tab_no,
												:message => 
												 " --> Error 08 - Field Blank."
	validates_length_of :isbn_tab_no,
											:maximum => 20,
											:message =>
											 " --> Error 09 - Greater than 20 char."

	# --------------------------------------------------------------- #
	# -- Publisher                                                    #
	# -- Error 01 - Invalid no data in field.                         #
	# -- Error 02 - Greater than 50 char.                             #
	# --------------------------------------------------------------- #
	validates_presence_of :publisher,
												:message => 
												 " ----> Error 10 - Field Blank."
	validates_length_of :publisher,
											:maximum => 20,
											:message =>
											 " ----> Error 11 - Greater than 20 char."

	# --------------------------------------------------------------- #
	# -- Published Date                                               #
	# -- Error 12 -                                                   #
	# --------------------------------------------------------------- #

	# --------------------------------------------------------------- #
	# -- Location                                                     #
	# -- Error 13 - Invalid no data in field.                         #
	# -- Error 14 - Greater than 20 char.                             #
	# --------------------------------------------------------------- #
	validates_presence_of :location,
												:message => 
												 " -----> Error 13 - Field Blank."
	validates_length_of :location,
											:maximum => 20,
											:message =>
											 " -----> Error 14 - Greater than 20 char."

	# --------------------------------------------------------------- #
	# -- Price                                                        #
	# -- Error 15 - Invalid no data in field.                         #
	# -- Error 16 - Value must be 0 - 100.                            #
	# -- Error 17 - Value not numeric.                                #
	# -- Error 18 - Invalid format xxx.xx.                            #
	# --------------------------------------------------------------- #
	validates_presence_of :price,
												:message => 
												 " ---------> Error 15 - Field Blank."
	validates_length_of :price,
											:within => 0..100,
											:message =>
											 " ---------> Error 16 - Value must be 0 - 100."
	validates_numericality_of :price,
														:message =>
											 			 " ---------> Error 17 - Value not numeric."
	validates_format_of :price,
#											:with => /\d{1,3}\.\d{0,2}$/,
											:with => /\A\d{1,3}.\d{0,2}\z/,
											:message =>
                       " ---------> Error 18 - Invalid format (xxx.xx)."

	# --------------------------------------------------------------- #
	# -- Purchase Date                                                #
	# -- Error 19 -                                                   #
	# --------------------------------------------------------------- #

	# --------------------------------------------------------------- #
	# -- Entry Date                                                   #
	# -- Error 20 -                                                   #
	# --------------------------------------------------------------- #

	# --------------------------------------------------------------- #
	# -- Condition                                                    #
	# -- Error 21 -                                                   #
	# --------------------------------------------------------------- #

	# --------------------------------------------------------------- #
	# -- Media Type                                                   #
	# -- Error 22 -                                                   #
	# --------------------------------------------------------------- #

	# --------------------------------------------------------------- #
	# -- Purpose                                                      #
	# -- Error 23 -                                                   #
	# --------------------------------------------------------------- #

	# --------------------------------------------------------------- #
	# -- Book Type                                                    #
	# -- Error 24 -                                                   #
	# --------------------------------------------------------------- #

end

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/13/2020 : 0.0.1  : Original.                                   #
#            : 0.0.2  : Add verification for Author.                #
# ----------------------------------------------------------------- #
# 05/14/2020 : 0.0.3  : Add verification for title.                 #
#            :        :                      series_name,           #
#            :        :                      series_no,             #
#            :        :                      isbn_tab_no,           #
#            :        :                      publisher,             #
#            :        :                      published_date,        #
#            :        :                      location,              #
#            :        :                      price,                 #
#            :        :                      purchase_date,         #
#            :        :                      entry_date,            #
#            :        :                      condition_id,          #
#            :        :                      media_type_id,         #
#            :        :                      purpose_id,            #
#            :        :                      book_type_id.          #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
