class MediatypesController < ApplicationController
  before_action :set_mediatype, only: [:show, :edit, :update, :destroy]

  # GET /mediatypes
  # GET /mediatypes.json
  def index
    @mediatypes = Mediatype.all
  end

  # GET /mediatypes/1
  # GET /mediatypes/1.json
  def show
  end

  # GET /mediatypes/new
  def new
    @mediatype = Mediatype.new
  end

  # GET /mediatypes/1/edit
  def edit
  end

  # POST /mediatypes
  # POST /mediatypes.json
  def create
    @mediatype = Mediatype.new(mediatype_params)

    respond_to do |format|
      if @mediatype.save
        format.html { redirect_to @mediatype, notice: 'Mediatype was successfully created.' }
        format.json { render :show, status: :created, location: @mediatype }
      else
        format.html { render :new }
        format.json { render json: @mediatype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mediatypes/1
  # PATCH/PUT /mediatypes/1.json
  def update
    respond_to do |format|
      if @mediatype.update(mediatype_params)
        format.html { redirect_to @mediatype, notice: 'Mediatype was successfully updated.' }
        format.json { render :show, status: :ok, location: @mediatype }
      else
        format.html { render :edit }
        format.json { render json: @mediatype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mediatypes/1
  # DELETE /mediatypes/1.json
  def destroy
    @mediatype.destroy
    respond_to do |format|
      format.html { redirect_to mediatypes_url, notice: 'Mediatype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mediatype
      @mediatype = Mediatype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mediatype_params
      params.fetch(:mediatype, {})
    end
end
