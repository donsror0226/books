#!/bin/bash
#
# ------------------------------------------------------------------------- #
# System    : Centos 7.7                                                    #
#   Name    : peekaboo                                                      #
# Location  : /home/don/workspace/books/app/models/                         #
# File Name : condition.rb                                                  #
# Rev. Date : 06/24/2020                                                    #
# Rev. No.  : 0.0.3                                                         #
# ------------------------------------------------------------------------- #
#

class Condition < ApplicationRecord
	#has_many :books

	# ----------------------------------------------------------------------- #
	# -- Condition idx                                                        #
	# -- Error 01 - Invalid no data in field.                                 #
	# -- Error 02 - Value not numeric.                                        #
	# -- Error 03 - Value not between 1 - 9.                                  #
	# -- Error 04 - Value not Unique on Save.                                 #
	# -- Error 05 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :condition_idx,
												:message => 
												 " -----> Error 01 - Field Blank."
	validates_numericality_of :condition_idx,
														:allow_nil => true,
														:message =>
											 			 " -------> Error 02 - Value not numeric."
	validates_inclusion_of :condition_idx,
												 :within => 0..9,
												 :message => 
												  " -----> Error 03 - Value must be 0 - 9."
	validates_uniqueness_of :condition_idx,
													:on => :create,
													:message =>
													 " -----> Error 04 - Value not Unique on create."
	validates_uniqueness_of :condition_idx,
													:on => :update,
													:message =>
													 " -----> Error 05 - Value not Unique on update."

	# ----------------------------------------------------------------------- #
	# -- Condition Name                                                       #
	# -- Error 06 - Invalid no data in field.                                 #
	# -- Error 07 - Greater than 10 char.                                     #
	# -- Error 08 - Value not Unique on Save.                                 #
	# -- Error 09 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :condition_name,
												:message => 
												 " -------> Error 06 - Field Blank."
	validates_length_of :condition_name,
											:maximum => 10,
											:message =>
											 " --> Error 07 - Greater than 10 char."
	validates_uniqueness_of :condition_name,
													:on => :create,
													:message =>
													 " -----> Error 08 - Value not Unique."
	validates_uniqueness_of :condition_name,
													:on => :update,
													:message =>
													 " -----> Error 09 - Value not Unique."
end

#
# ------------------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                                     #
# ------------------------------------------------------------------------- #
# 06/21/2020 : 0.0.1  : Original.                                           #
#            : 0.0.2  : Add verification for condition_idx.                 #
#            :        :                      condition_name.                #
# ------------------------------------------------------------------------- #
# 06/24/2020 : 0.0.3  : Add validates_inclusion_of to condition_idx.        #
# ------------------------------------------------------------------------- #
#            :        :                                                     #
# ------------------------------------------------------------------------- #
