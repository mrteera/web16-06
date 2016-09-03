class AllquotationsController < ApplicationController
  before_action :set_allquotation, only: [:show, :edit, :update, :destroy]

  # GET /allquotations
  # GET /allquotations.json
  def index
    @allquotations = Allquotation.all
    #@allquotation = Allquotation.all
  end

  # GET /allquotations/1
  # GET /allquotations/1.json
  def show
  end

  # GET /allquotations/new
  def new
    @allquotation = Allquotation.new
  end

  # GET /allquotations/1/edit
  def edit
  end

  # POST /allquotations
  # POST /allquotations.json
  def create
    if(params[:allquotation][:categories_id] == '-1')
      @categories= Category.create(title:params[:categories_title])
      params[:allquotation][:categories_id] = @categories.id
    end

    @allquotation = Allquotation.new(allquotation_params)

    respond_to do |format|
      if @allquotation.save
        format.html { redirect_to @allquotation, notice: 'Allquotation was successfully created.' }
        format.json { render :show, status: :created, location: @allquotation }
      else
        format.html { render :new }
        format.json { render json: @allquotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allquotations/1
  # PATCH/PUT /allquotations/1.json
  def update
    respond_to do |format|
      if @allquotation.update(allquotation_params)
        format.html { redirect_to @allquotation, notice: 'Allquotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @allquotation }
      else
        format.html { render :edit }
        format.json { render json: @allquotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allquotations/1
  # DELETE /allquotations/1.json
  def destroy
    @allquotation.destroy
    respond_to do |format|
      format.html { redirect_to allquotations_url, notice: 'Allquotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allquotation
      @allquotation = Allquotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allquotation_params
      params.require(:allquotation).permit(:quote, :author, :categories_id)
    end
end
