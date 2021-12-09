class OficinasController < ApplicationController
  before_action :set_oficina, only: %i[ show edit update destroy ]

  # GET /oficinas or /oficinas.json
  def index
    @oficinas = Oficina.all
  end

  # GET /oficinas/1 or /oficinas/1.json
  def show
  end

  # GET /oficinas/new
  def new
    @oficina = Oficina.new
    @edificios = Edificio.all
  end

  # GET /oficinas/1/edit
  def edit
    
    @edificios = Edificio.all
  end

  # POST /oficinas or /oficinas.json
  def create
    @oficina = Oficina.new(oficina_params)

    respond_to do |format|
      if @oficina.save
        format.html { redirect_to @oficina, notice: "Oficina fue creada con exito" }
        
      else
        format.html { render :new, status: :unprocessable_entity }
      
      end
    end
  end

  # PATCH/PUT /oficinas/1 or /oficinas/1.json
  def update
    respond_to do |format|
      if @oficina.update(oficina_params)
        format.html { redirect_to @oficina, notice: "Oficina fue actualizada con exito." }
     
        
      else
         @edificios = Edificio.all
         format.html { render :edit, status: :unprocessable_entity } 
      end
    end
  end

  # DELETE /oficinas/1 or /oficinas/1.json
  def destroy
    @oficina.destroy
    respond_to do |format|
      format.html { redirect_to oficinas_url, notice: "Oficina fue destruida con exito" }
     
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oficina
      @oficina = Oficina.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oficina_params
      params.require(:oficina).permit(:numero, :edificio_id)
    end
end
