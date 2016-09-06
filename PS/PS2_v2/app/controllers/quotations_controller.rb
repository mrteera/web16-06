class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  # GET /quotations.json
  def index
    getcontent
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

  def getcontent
    if cookies[:killedQuoteArr] == nil
      cookies[:killedQuoteArr]=JSON.generate([])
    end
    @quotations = Quotation.where.not(id:JSON.parse(cookies[:killedQuoteArr]))
  end

  def search
    respond_to do |format|
      if cookies[:killedQuoteArr] == nil
        cookies[:killedQuoteArr]=JSON.generate([])
      end
      @quotations=Quotation.where('lower(quote) like ? OR lower(author_name) like ?','%'+params[:q].downcase+'%','%'+params[:q].downcase+'%').where.not(id:JSON.parse(cookies[:killedQuoteArr])) #,fid:ind_by_quote(params[:q])
      format.html { render :index }
    end
  end

  def kill
      if cookies[:killedQuoteArr] == nil
        cookies[:killedQuoteArr]=JSON.generate([params[:pass]])
      else
        cookies[:killedQuoteArr]=JSON.generate(JSON.parse(cookies[:killedQuoteArr]) << params[:pass])
      end
      getcontent
      redirect_to action: 'index'
  end

  def quotation_cookie_erase
     cookies.delete :killedQuoteArr
     redirect_to action: 'index'
  end

  def export
    @quotations=Quotation.all.as_json
    pp @quotations
    respond_to do |format|
      #format.html
      format.xml{render xml: @quotations, content_type: Mime::XML}
      format.json{render json: @quotations}
      end
  end

  def import_xml
    # http = Net::HTTP.new('localhost', 3000)
    # req = Net::HTTP::Get.new('/export-quotations.json')
    # req.initialize_http_header({"Accept" => "application/json"})
    # response = http.request(req)
    # puts response.body
    #
    # http = Net::HTTP.new('localhost', 3000)
    # req = Net::HTTP::Get.new('/export-quotations.xml')
    # req.initialize_http_header({"Accept" => "application/xhtml+xml,application/xml;q=0.9"})
    # response = http.request(req)
    # @doc = Nokogiri::HTML(response.body)
    # obj= @doc.xpath("//objects//object")
    #
    # obj.each do |o|
    #   Quotation.create(
    #       :quote=>o.css('quote').text,
    #       :author_name=>o.css('author-name').text,
    #       :category_id=>o.css('category-id').text
    #   )
    #
    # end

    doc = Nokogiri::XML(
        open('http://web7.cs.ait.ac.th/ps2/quotations/export.xml'),
        # open('http://quotes.rest/qod.xml'),
        nil,
        'UTF-8'
    )

    number_of_columns= doc.root.first_element_child.elements.count

    all_nodes = []
    doc.traverse {|node|
      all_nodes << node
    }
    items = []
    all_nodes.each_with_index { |node, index|
      if node.text? and !node.text.strip.empty?
        items << all_nodes[index + 1].name
        items << node
      end
    }

    items.each_with_index.collect { |each, index|
      if index % 2 == 0
        if each =~ /quo/i
          each = 'quote'
        elsif each =~ /auth/i
          each = 'author-name'
        elsif each =~ /cat/i
          each = 'category'
        elsif each =~ /name/i
          each = each + rand(10).to_s
        else
          each = each
        end
        items[index] = each
      end
    }

    quotation_output = []
    items.each_slice(number_of_columns*2).to_a.each { |each|
      quotation_output << Hash[*each]
    }

    quotation_output.each do |row|
      category= row['category']
      @check_category_exists = Category.where('lower(name) like ?',category.to_s.downcase).all #category.downcase)
      if(@check_category_exists.to_a.count==0)
        category = Category.create(
            :name=>category
        )
       category_id=category.id
      else
        category_id= @check_category_exists.map(&:id)[0]
      end

      Quotation.create(
          :quote=>row['quote'],
          :author_name=>row['author-name'],
          :category_id=>category_id
      )
    end
    redirect_to action: 'index'

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
