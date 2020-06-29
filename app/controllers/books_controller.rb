#!/bin/bash
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/app/controllers/            #
# File Name : books_controller.rb                                   #
# Rev. Date : 06/08/2020                                            #
# Rev. No.  : 0.0.5                                                 #
# ----------------------------------------------------------------- #
#

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  ## Section Add by DPS
  ## GET /books/1
  ## GET /books/1.json
  def search
    if !params[:q].blank?
      @books = Book.where("author like ?", "%" + params[:q] + "%")
    end
  end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    ## This part of the code put so many records on the screen at one       ##
    ##   time with Prev / No. of screens / Next.                        DPS ##
    @books = Book.paginate :page => params[:page]
                          # :order => 'id'
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
  #  @mediatype = Mediatype.all

  #  respond_to do |format|
  #    format.html   # show.html.erb
  #  end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      ## params.fetch(:book, {}) ##
      params.require(:book).permit(:author, :title, :series_name, :series_no,
                     :isbn_tab_no, :publisher, :published_date, 
                     :location, :price, :purchase_date, :entry_date, 
                     :condition_id, :media_type_id, :purpose_id, :book_type_id,
                     :created_at, :updated_at, :search, :q)
      ## example -> params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
    end
end

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 05/05/2020 : 0.0.1  : Original.                                   #
# ----------------------------------------------------------------- #
# 05/06/2020 : 0.0.2  : Replaced params.fetch with params.require.  #
# ----------------------------------------------------------------- #
# 05/13/2020 : 0.0.3  : Rewrote multipliable times.                 #
# ----------------------------------------------------------------- #
# 05/31/2020 : 0.0.4  : Add pageinating.                            #
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
# 06/08/2020 : 0.0.5  : Clean up remove unneeded code and comments. #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
