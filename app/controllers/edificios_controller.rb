class EdificiosController < ApplicationController
  before_action :set_edificio, only: %i[ show edit update destroy ]

  # GET /edificios or /edificios.json
  def index
    @edificios = Edificio.all
  end

  # GET /edificios/1 or /edificios/1
  def show
  end

  # GET /edificios/new
  def new
    @edificio = Edificio.new
    @edificios = Edificio.all
  end

  # GET /edificios/1/edit
  def edit
    @edificios = Edificio.all
  end

  # POST /edificios or /edificios.json
  def create
    @edificio = Edificio.new(edificio_params)

    respond_to do |format|
      if @edificio.save
        format.html { redirect_to @edificio, notice: "Edificio fue creado con exito" }
        
      else
        format.html { render :new, status: :unprocessable_entity }
       
      end
    end
  end

  # PATCH/PUT /edificios/1 or /edificios/1.json
  def update
    respond_to do |format|
      if @edificio.update(edificio_params)
        format.html { redirect_to @edificio, notice: "Edificio fue actualizado" }
       
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /edificios/
  def destroy
    @edificio.destroy
    redirect_to edificios_path
rescue
    flash[:error_edificio] = "No se puede eliminar el edificio #{@edificio.nombre}, porque tiene oficinasregistradas"
    redirect_to edificios_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edificio
      @edificio = Edificio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def edificio_params
      params.require(:edificio).permit(:nombre, :direccion, :ciudad, :foto_portada)
    end
end
