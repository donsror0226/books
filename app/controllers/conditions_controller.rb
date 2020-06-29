#!/bin/bash
#
# ----------------------------------------------------------------- #
# System    : Centos 7.7                                            #
#   Name    : peekaboo                                              #
# Location  : /home/don/workspace/books/app/controllers/            #
# File Name : conditions_controller.rb                              #
# Rev. Date : 06/08/2020                                            #
# Rev. No.  : 0.0.5                                                 #
# ----------------------------------------------------------------- #
#

class ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  # GET /conditions
  # GET /conditions.json
  def index
    @conditions = Condition.all
  end

  # GET /conditions/1
  # GET /conditions/1.json
  def show
    @condition = Condition.find(params[:id])
    @conditions = Condition.all
        #render :index
        #format.html { render :edit }
  end

  # GET /conditions/new
  def new
    ## This line will get the last record from the condition table.        ##
    @last_idx = Condition.last
    @condition = Condition.new
  end

  # GET /conditions/1/edit
  def edit
    #@last_idx = Condition.last
  end

  # POST /conditions
  # POST /conditions.json
  def create
    @condition = Condition.new(condition_params)

    respond_to do |format|
      if @condition.save
        format.html { redirect_to @condition, notice: 'Condition was successfully created.' }
        format.json { render :show, status: :created, location: @condition }
      else
        format.html { render :new }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conditions/1
  # PATCH/PUT /conditions/1.json
  def update
    respond_to do |format|
      if @condition.update(condition_params)
        format.html { redirect_to @condition, notice: 'Condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @condition }
      else
        format.html { render :edit }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conditions/1
  # DELETE /conditions/1.json
  def destroy
    #@condition.destroy
    #respond_to do |format|
    #  format.html { redirect_to conditions_url, notice: 'Condition was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  def condition_destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def condition_params
      ## params.fetch(:condition, {}) ##
      params.require(:condition).permit(:condition_idx, :condition_name,
                     :last_idx, :next_idx)
    end
end

#
# ----------------------------------------------------------------- #
# Date Rev.  : Rev. # :     Description                             #
# ----------------------------------------------------------------- #
# 06/21/2020 : 0.0.1  : Original.                                   #
#            : 0.0.2  : Add params (see books_controller.rb).       #
#            : 0.0.3  : Add get last record in new.                 #
# ----------------------------------------------------------------- #
#            :        :                                             #
# ----------------------------------------------------------------- #
