class MicrositesController < ApplicationController
  before_action :set_microsite, only: [:show, :edit, :update, :destroy]

  # GET /microsites
  # GET /microsites.json
  def index
    @microsites = Microsite.all
  end

  # GET /microsites/1
  # GET /microsites/1.json
  def show
  end

  # GET /microsites/new
  def new
    @microsite = Microsite.new
  end

  # GET /microsites/1/edit
  def edit
  end

  # POST /microsites
  # POST /microsites.json
  def create
    @microsite = Microsite.new(microsite_params)

    respond_to do |format|
      if @microsite.save
        format.html { redirect_to @microsite, notice: 'Microsite was successfully created.' }
        format.json { render action: 'show', status: :created, location: @microsite }
      else
        format.html { render action: 'new' }
        format.json { render json: @microsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microsites/1
  # PATCH/PUT /microsites/1.json
  def update
    respond_to do |format|
      if @microsite.update(microsite_params)
        format.html { redirect_to @microsite, notice: 'Microsite was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @microsite }
      else
        format.html { render action: 'edit' }
        format.json { render json: @microsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microsites/1
  # DELETE /microsites/1.json
  def destroy
    @microsite.destroy
    respond_to do |format|
      format.html { redirect_to microsites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_microsite
      @microsite = Microsite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def microsite_params
      params.require(:microsite).permit(:name)
    end
end
