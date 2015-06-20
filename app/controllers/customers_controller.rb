class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        # format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        # format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
    )
  end
end
