class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  # GET /quotations.json
  def index
    if cookies[:killedQuoteArr] == nil
      cookies[:killedQuoteArr]=JSON.generate([])
    end
    @quotations = Quotation.where.not(id:JSON.parse(cookies[:killedQuoteArr]))
    @quotation = Quotation.where.not(id:JSON.parse(cookies[:killedQuoteArr]))
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create

    if(params[:quotation][:category_id] == '-1')
      @category = Category.create(name:params[:category_name])
      params[:quotation][:category_id] = @category.id
    end

    @quotation = Quotation.new(quotation_params)

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    respond_to do |format|
      @quotations=Quotation.where('lower(quote) like ? OR lower(author_name) like ?','%'+params[:q].downcase+'%','%'+params[:q].downcase+'%') #,find_by_quote(params[:q])
      format.html { render :index }
    end
  end

  def kill
    respond_to do |format|
      if cookies[:killedQuoteArr] == nil
        cookies[:killedQuoteArr]=JSON.generate([params[:pass]])
      else
        cookies[:killedQuoteArr]=JSON.generate(JSON.parse(cookies[:killedQuoteArr]) << params[:pass])
      end
     @quotations=Quotation.where.not(id:JSON.parse(cookies[:killedQuoteArr]))
      logger.debug(params[:id])
      format.html { render :index }
    end
  end

  def quotation_cookie_erase
    respond_to do |format|
      @quotations=Quotation.all
      #cookies[:killedQuoteArr]={:expires=> 1.hour.ago} same result as delete
      cookies.delete :killedQuoteArr
      format.html { render :index }
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:quote, :author_name, :category_id)
    end
end
