#!/bin/bash
#
# Tells Rails where you actual home page is located and resources.
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/config/                     #
# File Name : routes.rb                                             #
# Rev. Date : 05/13/2020                                            #
# Rev. No.  : 0.0.4                                                 #
# ----------------------------------------------------------------- #
#

Rails.application.routes.draw do

  ## Rails provides a resources method which can be used to declare a
  ##   standard REST resource.
  ##   You can create, read, update, destroy (CRUD).
  resources :books
  resources :conditions
  resources :mediatypes
  resources :purposes
  resources :booktypes

  #get 'books/new'

  get 'search', to: "books#search"
  get 'book_search', to: "books#search"

  ##get 'show', to: "books#show"

  ## #2 - search
  ## Use to setup the /search to your search page and pages#search
  ##   means search.html.erb is located in the view folder.
  #get '/search' => 'books#search', :as => 'search_book'

  #get 'more_info', to: 'books#more'

	## Use on web page when you type localhost:3000 it will bring up the 
	##   Yay! You're on Rails default web page application working.
	##   No git 'xxxxx' or resources :yyyyy's

	# ## Tells the web page when you type localhost:3000/welcome/index it will
	# ##   bring up the index page for your application.
	# ##   It uses the precise location of the index file.
  # get 'welcome/index'

  # ## Tells the web page when you type localhost:3000/ it will  
  # ##   bring up the index page for your application.
  # ##   It uses the root of the application.
  # root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/05/2020 : 0.0.1  : Original.                                   #
#            : 0.0.2  : Add root 'welcome#index'                    #
#            : 0.0.3  : Add resources :books                        #
# ----------------------------------------------------------------- #
# 05/13/2020 : 0.0.4  : Add resources :condition, :mediatypes,      #
#            :        :               :purposes,  :booktypes.       #
#            :        : Comment out get welcome/index,              #
#            :        :             root welcome#index.             #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
