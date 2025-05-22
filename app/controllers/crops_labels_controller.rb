class CropsLabelsController < ApplicationController
  before_action :set_crops_label, only: %i[ show edit update destroy ]

  # GET /crops_labels or /crops_labels.json
  def index
    @crops_labels = CropsLabel.all
  end

  # GET /crops_labels/1 or /crops_labels/1.json
  def show
  end

  # GET /crops_labels/new
  def new
    @crops_label = CropsLabel.new
  end

  # GET /crops_labels/1/edit
  def edit
  end

  # POST /crops_labels or /crops_labels.json
  def create
    @crops_label = CropsLabel.new(crops_label_params)

    respond_to do |format|
      if @crops_label.save
        format.html { redirect_to @crops_label, notice: "Crops label was successfully created." }
        format.json { render :show, status: :created, location: @crops_label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crops_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crops_labels/1 or /crops_labels/1.json
  def update
    respond_to do |format|
      if @crops_label.update(crops_label_params)
        format.html { redirect_to @crops_label, notice: "Crops label was successfully updated." }
        format.json { render :show, status: :ok, location: @crops_label }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crops_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crops_labels/1 or /crops_labels/1.json
  def destroy
    @crops_label.destroy!

    respond_to do |format|
      format.html { redirect_to crops_labels_path, status: :see_other, notice: "Crops label was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crops_label
      @crops_label = CropsLabel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def crops_label_params
      params.expect(crops_label: [ :crop_id, :crop_category_id ])
    end
end
