#!/bin/bash
#
# ------------------------------------------------------------------------- #
# System    : Centos 7.7                                                    #
#   Name    : peekaboo                                                      #
# Location  : /home/don/workspace/books/app/models/                         #
# File Name : purpose.rb                                                    #
# Rev. Date : 07/04/2020                                                    #
# Rev. No.  : 0.0.4                                                         #
# ------------------------------------------------------------------------- #
#

class Purpose < ApplicationRecord
	#has_many :books

	# ----------------------------------------------------------------------- #
	# This part of the code put so many records on the screen at              #
	#   one time with Prev / No. of sreens / Next.                        DPS #
	# ----------------------------------------------------------------------- #
	cattr_reader :per_page
	@@per_page = 12

	# ----------------------------------------------------------------------- #
	# -- Purpose idx                                                          #
	# -- Error 01 - Invalid no data in field.                                 #
	# -- Error 02 - Value not numeric.                                        #
	# -- Error 03 - Value not between 0 - 9999.                               #
	# -- Error 04 - Value not Unique on Save.                                 #
	# -- Error 05 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :purpose_idx,
												:message => 
												 " -----> Error 01 - Field Blank."
	validates_numericality_of :purpose_idx,
														:allow_nil => true,
														:message =>
											 			 " -------> Error 02 - Value not numeric."
	validates_inclusion_of :purpose_idx,
												 :within => 0..9999,
												 :message => 
												  " -----> Error 03 - Value must be 0 - 9999."
	validates_uniqueness_of :purpose_idx,
													:on => :create,
													:message =>
													 " -----> Error 04 - Value not Unique on create."
	validates_uniqueness_of :purpose_idx,
													:on => :update,
													:message =>
													 " -----> Error 05 - Value not Unique on update."

	# ----------------------------------------------------------------------- #
	# -- Purpose Type                                                         #
	# -- Error 06 - Invalid no data in field.                                 #
	# -- Error 07 - Greater than 15 char.                                     #
	# -- Error 08 - Value not Unique on Save.                                 #
	# -- Error 09 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :purpose_type,
												:message => 
												 " -------> Error 06 - Field Blank."
	validates_length_of :purpose_type,
											:maximum => 15,
											:message =>
											 " --> Error 07 - Greater than 15 char."
	##validates_uniqueness_of :purpose_type,
	##												:on => :create,
	##												:message =>
	##												 " -----> Error 08 - Value not Unique."
	##validates_uniqueness_of :purpose_type,
	##												:on => :update,
	##												:message =>
	##												 " -----> Error 09 - Value not Unique."
													 
	# ----------------------------------------------------------------------- #
	# -- Purpose Name                                                         #
	# -- Error 10 - Invalid no data in field.                                 #
	# -- Error 11 - Greater than 20 char.                                     #
	# -- Error 12 - Value not Unique on Save.                                 #
	# -- Error 13 - Value not Unique on Update.                               #
	# ----------------------------------------------------------------------- #
	validates_presence_of :purpose_name,
												:message => 
												 " -------> Error 10 - Field Blank."
	validates_length_of :purpose_name,
											:maximum => 20,
											:message =>
											 " --> Error 11 - Greater than 20 char."
	validates_uniqueness_of :purpose_name,
													:on => :create,
													:message =>
													 " -----> Error 12 - Value not Unique."
	validates_uniqueness_of :purpose_name,
													:on => :update,
													:message =>
													 " -----> Error 13 - Value not Unique."
end

#
# ------------------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                                     #
# ------------------------------------------------------------------------- #
# 07/03/2020 : 0.0.1  : Original.                                           #
#            : 0.0.2  : Add verification for media_type_idx.                #
#            :        :                      media_type_name.               #
#            : 0.0.3  : Add validates_inclusion_of to media_type_idx.       #
# ------------------------------------------------------------------------- #
# 07/04/2020 : 0.0.4  : Add pageinating.                                    #
#            :        : This part of the code put so many records           #
#            :        :   on the screen at one time with                    #
#            :        :   Prev / No. of screens / Next.                     #
#            :        : See controller/purpose_controller.rb                #
#            :        :   for part 1 of pageinating.                        #
#            :        : See models/purpose.rb for part 2 of                 #
#            :        :   pageinating.                                      #
#            :        : See view/books/index.html.erb for part 3            #
#            :        :   of pageinating.                                   #
#            :        : See config/environment.rb for part 4                #
#            :        :   pageinating.                                      #
# ------------------------------------------------------------------------- #
#            :        :                                                     #
# ------------------------------------------------------------------------- #
