#!/bin/bash
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/config/                     #
# File Name : environment.rb                                        #
# Rev. Date : 05/31/2020                                            #
# Rev. No.  : 0.0.2                                                 #
# ----------------------------------------------------------------- #
#

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Specify gems that this applicatin depends on and have them installed
#  with rake gem:install.
# Or add gem to Gemfile then run bundle install.
# Old version -----V----- below -----
#config.gem 'will_paginage',
#           :versin => '~> 3.3.0',
#           :source => 'http:/gemcutter.org'
# -----------------------------------

require "will_paginate"

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/13/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 05/31/2020 : 0.0.2  : Add pageinating.                            #
#            :        : This part of the code put so many records   #
#            :        :   on the screen at one time with            #
#            :        :   Prev / No. of screens / Next.             #
#            :        : See controller/books_controller.rb          #
#            :        :   for part 1 of pageinating.                #
#            :        : See models/book.rb for part 2 of            #
#            :        :   pageinating.                              #
#            :        : See view/books/index.html.erb for part 3    #
#            :        :   of pageinating.                           #
#            :        : See environment.rb for part 4 of            #
#            :        :   pageinating.                              #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
