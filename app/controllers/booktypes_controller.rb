#!/bin/bash
#
# ------------------------------------------------------------------------- #
# System    : Centos 7.7                                                    #
#   Name    : peekaboo                                                      #
# Location  : /home/don/workspace/books/app/controllers/                    #
# File Name : booktypes_controller.rb                                       #
# Rev. Date : 06/29/2020                                                    #
# Rev. No.  : 0.0.3                                                         #
# ------------------------------------------------------------------------- #
#

class BooktypesController < ApplicationController
  before_action :set_booktype, only: [:show, :edit, :update, :destroy]

  # GET /booktypes
  # GET /booktypes.json
  def index
    @booktypes = Booktype.all
  end

  # GET /booktypes/1
  # GET /booktypes/1.json
  def show
    @booktype = Booktype.find(params[:id])
      #@booktypes = Booktype.all
  end

  # GET /booktypes/new
  def new
    ## Thie first line will get the last record from the booktype table.   ##
    ## The next line will add 1 to last_index.                             ##
    @last_idx = Booktype.last.book_type_idx
    @next_idx = @last_idx + 1
    @booktype = Booktype.new
  end

  # GET /booktypes/1/edit
  def edit
  end

  # POST /booktypes
  # POST /booktypes.json
  def create
    @booktype = Booktype.new(booktype_params)

    respond_to do |format|
      if @booktype.save
        format.html { redirect_to @booktype, notice: 'Booktype was successfully created.' }
        format.json { render :show, status: :created, location: @booktype }
      else
        format.html { render :new }
        format.json { render json: @booktype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booktypes/1
  # PATCH/PUT /booktypes/1.json
  def update
    respond_to do |format|
      if @booktype.update(booktype_params)
        format.html { redirect_to @booktype, notice: 'Booktype was successfully updated.' }
        format.json { render :show, status: :ok, location: @booktype }
      else
        format.html { render :edit }
        format.json { render json: @booktype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booktypes/1
  # DELETE /booktypes/1.json
  def destroy
    @booktype.destroy
    respond_to do |format|
      format.html { redirect_to booktypes_url, notice: 'Booktype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booktype
      @booktype = Booktype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booktype_params
      ## params.fetch(:booktype, {})
      params.require(:booktype).permit(:book_type_idx, :book_type_name,
                     :last_idx, :next_idx, @last_idx, @next_idx)
    end
end

#
# ------------------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                                     #
# ------------------------------------------------------------------------- #
# 06/29/2020 : 0.0.1  : Original, Copyed conditions_controller.rb           #
#            : 0.0.2  : Add params (see conditions_controller.rb).          #
#            : 0.0.3  : Add get last record in new.                         #
# ------------------------------------------------------------------------- #
#            :        :                                                     #
# ------------------------------------------------------------------------- #
