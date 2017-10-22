class OrdenationsController < ApplicationController
  before_action :set_configuration
  before_action :set_ordenation, only: [:show, :edit, :update, :destroy]

  # GET /ordenations
  # GET /ordenations.json
  def index
    @ordenations = @configuration.ordenations
  end

  # GET /ordenations/1
  # GET /ordenations/1.json
  def show
  end

  # GET /ordenations/new
  def new
    @ordenation = Ordenation.new
  end

  # GET /ordenations/1/edit
  def edit
  end

  # POST /ordenations
  # POST /ordenations.json
  def create
    @ordenation = @configuration.ordenations.build(ordenation_params)

    respond_to do |format|
      if @ordenation.save
        format.html { redirect_to [@configuration, @ordenation], notice: 'Ordenation was successfully created.' }
        format.json { render :show, status: :created, location: @ordenation }
      else
        format.html { render :new }
        format.json { render json: @ordenation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordenations/1
  # PATCH/PUT /ordenations/1.json
  def update
    respond_to do |format|
      if @ordenation.update(ordenation_params)
        format.html { redirect_to [@configuration, @ordenation], notice: 'Ordenation was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordenation }
      else
        format.html { render :edit }
        format.json { render json: @ordenation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenations/1
  # DELETE /ordenations/1.json
  def destroy
    @ordenation.destroy
    respond_to do |format|
      format.html { redirect_to configuration_ordenations_url(@configuration), notice: 'Ordenation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordenation
      @ordenation = Ordenation.find(params[:id])
    end

    def set_configuration
      @configuration = ApplicationRecord::Configuration.find(params[:configuration_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordenation_params
      params.require(:ordenation).permit(:priority, :field, :direction, :configuration_id)
    end
end
