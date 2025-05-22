class CropsController < ApplicationController
  before_action :set_crop, only: %i[ show edit update destroy ]

  # GET /crops or /crops.json
  def index
    @crops = Crop.all
  end

  # GET /crops/1 or /crops/1.json
  def show
  end

  # GET /crops/new
  def new
    @crop = Crop.new
  end

  # GET /crops/1/edit
  def edit
  end

  # POST /crops or /crops.json
  def create
    @crop = Crop.new(crop_params)

    respond_to do |format|
      if @crop.save
        format.html { redirect_to @crop, notice: "Crop was successfully created." }
        format.json { render :show, status: :created, location: @crop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crops/1 or /crops/1.json
  def update
    respond_to do |format|
      @crop = Crop.find(params[:id])
        if @crop.listings.exists?
          redirect_to crops_path, notice: "Cannot delete crop because it has associated listings."
        else
      @crop.destroy
        redirect_to crops_path, notice: "Crop deleted successfully."
  end
    end
  end

  # DELETE /crops/1 or /crops/1.json
  def destroy
    @crop.destroy!

    respond_to do |format|
      format.html { redirect_to crops_path, status: :see_other, notice: "Crop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop
      @crop = Crop.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def crop_params
      params.expect(crop: [ :name, :description, :user_id ])
    end
end
