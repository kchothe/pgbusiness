class MatchedBusinessesController < ApplicationController
  before_action :set_matched_business, only: [:show, :edit, :update, :destroy]

  # GET /matched_businesses
  # GET /matched_businesses.json
  def index
    @matched_businesses = BusinessContactPhone.all
  end

  # GET /matched_businesses/1
  # GET /matched_businesses/1.json
  def show
  end

  # GET /matched_businesses/new
  def new
    @matched_business = MatchedBusiness.new
  end

  # GET /matched_businesses/1/edit
  def edit
  end

  # POST /matched_businesses
  # POST /matched_businesses.json
  def create
    @matched_business = MatchedBusiness.new(matched_business_params)

    respond_to do |format|
      if @matched_business.save
        format.html { redirect_to @matched_business, notice: 'Matched business was successfully created.' }
        format.json { render :show, status: :created, location: @matched_business }
      else
        format.html { render :new }
        format.json { render json: @matched_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matched_businesses/1
  # PATCH/PUT /matched_businesses/1.json
  def update
    respond_to do |format|
      if @matched_business.update(matched_business_params)
        format.html { redirect_to @matched_business, notice: 'Matched business was successfully updated.' }
        format.json { render :show, status: :ok, location: @matched_business }
      else
        format.html { render :edit }
        format.json { render json: @matched_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matched_businesses/1
  # DELETE /matched_businesses/1.json
  def destroy
    @matched_business.destroy
    respond_to do |format|
      format.html { redirect_to matched_businesses_url, notice: 'Matched business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matched_business
      @matched_business = MatchedBusiness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matched_business_params
      params.require(:matched_business).permit(:contact_phone_id, :business_id, :IsRecommended, :CreatedBy, :CreatedDate, :ModifiedBy, :ModifiedDate)
    end
end
