module Admin
  class CompaniesController < AdminController
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    # GET /companies
    # GET /companies.json
    def index
      @companies = Company.all.page params[:page]
    end

    # GET /companies/1
    # GET /companies/1.json
    def show
    end

    # GET /companies/new
    def new
      @company = Company.new
    end

    # GET /companies/1/edit
    def edit
    end

    # POST /companies
    # POST /companies.json
    def create
      @company = Company.new(company_params)

      respond_to do |format|
        if @company.save
          format.html { redirect_to @company, notice: 'Company was successfully created.' }
          format.json { render :show, status: :created, location: @company }
        else
          format.html { render :new }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /companies/1
    # PATCH/PUT /companies/1.json
    def update
      respond_to do |format|
        if @company.update(company_params)
          format.html { redirect_to @company, notice: 'Company was successfully updated.' }
          format.json { render :show, status: :ok, location: @company }
        else
          format.html { render :edit }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /companies/1
    # DELETE /companies/1.json
    def destroy
      @company.destroy
      respond_to do |format|
        format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def import
      unless params[:csv].present?
        @fields = Company.column_names
        @file = params[:file].path
        @import = SmarterCSV.process(@file,{:row_sep => :auto, :file_encoding => 'iso-8859-1'})
      else
        @csv = params[:csv]
        @old_field = params[:old_field].split(" ").map &:to_sym
        @field = params[:fields].map &:to_sym
        @merge = @old_field.zip(@field)
        @new_hash = Hash.new
        @merge.each do |k,v|
          if !v.empty?
            @new_hash[k] = v
          end
        end
        @options = {:chunk_size => 1,:key_mapping => @new_hash, :remove_unmapped_keys => true, :row_sep => :auto, :file_encoding => 'iso-8859-1'}
        Company.import(@csv,@options)
        Company.dedupe
        redirect_to admin_companies_path notice: "it worked"
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def company_params
        params.require(:company).permit(:name,:file)
      end
  end
end