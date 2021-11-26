class EdificiosController < ApplicationController
  before_action :set_edificio, only: %i[ show edit update destroy ]

  # GET /edificios or /edificios.json
  def index
    @edificios = Edificio.all
  end

  # GET /edificios/1 or /edificios/1.json
  def show
  end

  # GET /edificios/new
  def new
    @edificio = Edificio.new
  end

  # GET /edificios/1/edit
  def edit
  end

  # POST /edificios or /edificios.json
  def create
    @edificio = Edificio.new(edificio_params)

    respond_to do |format|
      if @edificio.save
        format.html { redirect_to @edificio, notice: "Edificio was successfully created." }
        format.json { render :show, status: :created, location: @edificio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @edificio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edificios/1 or /edificios/1.json
  def update
    respond_to do |format|
      if @edificio.update(edificio_params)
        format.html { redirect_to @edificio, notice: "Edificio was successfully updated." }
        format.json { render :show, status: :ok, location: @edificio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @edificio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edificios/1 or /edificios/1.json
  def destroy
    @edificio.destroy
    respond_to do |format|
      format.html { redirect_to edificios_url, notice: "Edificio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edificio
      @edificio = Edificio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def edificio_params
      params.require(:edificio).permit(:nombre, :direccion, :ciudad)
    end
end
