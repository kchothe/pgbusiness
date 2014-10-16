class ContactPhonesController < ApplicationController
  before_action :set_contact_phone, only: [:show, :edit, :update, :destroy]

  # GET /contact_phones
  # GET /contact_phones.json
  def index
    @contact_phones = ContactPhone.all
  end

  # GET /contact_phones/1
  # GET /contact_phones/1.json
  def show
  end

  # GET /contact_phones/new
  def new
    @contact_phone = ContactPhone.new
  end

  # GET /contact_phones/1/edit
  def edit
  end

  # POST /contact_phones
  # POST /contact_phones.json
  def create
    @contact_phone = ContactPhone.new(contact_phone_params)

    respond_to do |format|
      if @contact_phone.save
        format.html { redirect_to @contact_phone, notice: 'Contact phone was successfully created.' }
        format.json { render :show, status: :created, location: @contact_phone }
      else
        format.html { render :new }
        format.json { render json: @contact_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_phones/1
  # PATCH/PUT /contact_phones/1.json
  def update
    respond_to do |format|
      if @contact_phone.update(contact_phone_params)
        format.html { redirect_to @contact_phone, notice: 'Contact phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_phone }
      else
        format.html { render :edit }
        format.json { render json: @contact_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_phones/1
  # DELETE /contact_phones/1.json
  def destroy
    @contact_phone.destroy
    respond_to do |format|
      format.html { redirect_to contact_phones_url, notice: 'Contact phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_phone
      @contact_phone = ContactPhone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_phone_params
      params.require(:contact_phone).permit(:PhoneNumber, :PhoneNumberType, :CreatedBy, :CreatedDate, :ModifiedBy, :ModifiedDate)
    end
end
