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
  end

  # GET /oficinas/1/edit
  def edit
  end

  # POST /oficinas or /oficinas.json
  def create
    @oficina = Oficina.new(oficina_params)

    respond_to do |format|
      if @oficina.save
        format.html { redirect_to @oficina, notice: "Oficina was successfully created." }
        format.json { render :show, status: :created, location: @oficina }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oficina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oficinas/1 or /oficinas/1.json
  def update
    respond_to do |format|
      if @oficina.update(oficina_params)
        format.html { redirect_to @oficina, notice: "Oficina was successfully updated." }
        format.json { render :show, status: :ok, location: @oficina }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oficina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oficinas/1 or /oficinas/1.json
  def destroy
    @oficina.destroy
    respond_to do |format|
      format.html { redirect_to oficinas_url, notice: "Oficina was successfully destroyed." }
      format.json { head :no_content }
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
