#!/bin/bash
#
# ------------------------------------------------------------------------- #
# System    : Centos 7.7                                                    #
#   Name    : peekaboo                                                      #
# Location  : /home/don/workspace/books/app/models/                         #
# File Name : booktype.rb                                                   #
# Rev. Date : 06/29/2020                                                    #
# Rev. No.  : 0.0.3                                                         #
# ------------------------------------------------------------------------- #
#

class Booktype < ApplicationRecord
	#has_many :books

	# ----------------------------------------------------------------------- #
	# -- Book Type idx                                                        #
	# -- Error 01 - Invalid no data in field.                                 #
	# -- Error 02 - Value not numeric.                                        #
	# -- Error 03 - Value not between 0 - 9.                                  #
	# -- Error 04 - Value not Unique on Save.                                 #
	# -- Error 05 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :book_type_idx,
												:message => 
												 " -----> Error 01 - Field Blank."
	validates_numericality_of :book_type_idx,
														:allow_nil => true,
														:message =>
											 			 " -------> Error 02 - Value not numeric."
	validates_inclusion_of :book_type_idx,
												 :within => 0..9,
												 :message => 
												  " -----> Error 03 - Value must be 0 - 9."
	validates_uniqueness_of :book_type_idx,
													:on => :create,
													:message =>
													 " -----> Error 04 - Value not Unique on create."
	validates_uniqueness_of :book_type_idx,
													:on => :update,
													:message =>
													 " -----> Error 05 - Value not Unique on update."
													 
	# ----------------------------------------------------------------------- #
	# -- Book Type Name                                                       #
	# -- Error 06 - Invalid no data in field.                                 #
	# -- Error 07 - Greater than 10 char.                                     #
	# -- Error 08 - Value not Unique on Save.                                 #
	# -- Error 09 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :book_type_name,
												:message => 
												 " -------> Error 06 - Field Blank."
	validates_length_of :book_type_name,
											:maximum => 10,
											:message =>
											 " --> Error 07 - Greater than 10 char."
	validates_uniqueness_of :book_type_name,
													:on => :create,
													:message =>
													 " -----> Error 08 - Value not Unique."
	validates_uniqueness_of :book_type_name,
													:on => :update,
													:message =>
													 " -----> Error 09 - Value not Unique."
end

#
# ------------------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                                     #
# ------------------------------------------------------------------------- #
# 06/29/2020 : 0.0.1  : Original.                                           #
#            : 0.0.2  : Add verification for book_type_idx.                 #
#            :        :                      book_type_name.                #
# ------------------------------------------------------------------------- #
# 06/29/2020 : 0.0.3  : Add validates_inclusion_of to book_type_idx.        #
# ------------------------------------------------------------------------- #
#            :        :                                                     #
# ------------------------------------------------------------------------- #
