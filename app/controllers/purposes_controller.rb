#!/bin/bash
#
# ------------------------------------------------------------------------- #
# System    : Centos 7.7                                                    #
#   Name    : peekaboo                                                      #
# Location  : /home/don/workspace/books/app/controllers/                    #
# File Name : purposes_controller.rb                                        #
# Rev. Date : 07/04/2020                                                    #
# Rev. No.  : 0.0.4                                                         #
# ------------------------------------------------------------------------- #
#

class PurposesController < ApplicationController
  before_action :set_purpose, only: [:show, :edit, :update, :destroy]

  # GET /purposes
  # GET /purposes.json
  def index
    @purposes = Purpose.all

    ## This part of the code put so many records on the screen at one       ##
    ##   time with Prev / No. of screens / Next.                        DPS ##
    @purposes = Purpose.paginate :page => params[:page]
  end

  # GET /purposes/1
  # GET /purposes/1.json
  def show
    @purpose = Purpose.find(params[:id])
      #@purposes = Purpose.all
  end

  # GET /purposes/new
  def new
    ## Thie first line will get the last record from the booktype table.   ##
    ## The next line will add 1 to last_index.                             ##
    @last_idx = Purpose.last.purpose_idx
    @next_idx = @last_idx + 1
    @purpose = Purpose.new
  end

  # GET /purposes/1/edit
  def edit
  end

  # POST /purposes
  # POST /purposes.json
  def create
    @purpose = Purpose.new(purpose_params)

    respond_to do |format|
      if @purpose.save
        format.html { redirect_to @purpose, notice: 'Purpose was successfully created.' }
        format.json { render :show, status: :created, location: @purpose }
      else
        format.html { render :new }
        format.json { render json: @purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purposes/1
  # PATCH/PUT /purposes/1.json
  def update
    respond_to do |format|
      if @purpose.update(purpose_params)
        format.html { redirect_to @purpose, notice: 'Purpose was successfully updated.' }
        format.json { render :show, status: :ok, location: @purpose }
      else
        format.html { render :edit }
        format.json { render json: @purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purposes/1
  # DELETE /purposes/1.json
  def destroy
    @purpose.destroy
    respond_to do |format|
      format.html { redirect_to purposes_url, notice: 'Purpose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purpose
      @purpose = Purpose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purpose_params
      ## params.fetch(:purpose, {})
      params.require(:purpose).permit(:purpose_idx, :purpose_type,
                     :purpose_name, :last_idx, :next_idx,
                      @last_idx, @next_idx)
    end
end

#
# ------------------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                                     #
# ------------------------------------------------------------------------- #
# 07/03/2020 : 0.0.1  : Original, Copyed conditions_controller.rb           #
#            : 0.0.2  : Add params (see conditions_controller.rb).          #
#            : 0.0.3  : Add get last record in new.                         #
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
