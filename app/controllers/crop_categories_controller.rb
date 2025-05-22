class CropCategoriesController < ApplicationController
  before_action :set_crop_category, only: %i[ show edit update destroy ]

  # GET /crop_categories or /crop_categories.json
  def index
    @crop_categories = CropCategory.all
  end

  # GET /crop_categories/1 or /crop_categories/1.json
  def show
  end

  # GET /crop_categories/new
  def new
    @crop_category = CropCategory.new
  end

  # GET /crop_categories/1/edit
  def edit
  end

  # POST /crop_categories or /crop_categories.json
  def create
    @crop_category = CropCategory.new(crop_category_params)

    respond_to do |format|
      if @crop_category.save
        format.html { redirect_to @crop_category, notice: "Crop category was successfully created." }
        format.json { render :show, status: :created, location: @crop_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crop_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crop_categories/1 or /crop_categories/1.json
  def update
    respond_to do |format|
      if @crop_category.update(crop_category_params)
        format.html { redirect_to @crop_category, notice: "Crop category was successfully updated." }
        format.json { render :show, status: :ok, location: @crop_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crop_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crop_categories/1 or /crop_categories/1.json
  def destroy
    @crop_category.destroy!

    respond_to do |format|
      format.html { redirect_to crop_categories_path, status: :see_other, notice: "Crop category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop_category
      @crop_category = CropCategory.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def crop_category_params
      params.expect(crop_category: [ :category_name, :growing_condition ])
    end
end
