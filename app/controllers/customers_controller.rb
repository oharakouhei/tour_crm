class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    # ページャ機能のgem kaminariのみ
    # @customers = Customer.page(params[:page])
    # 検索機能のgem ransack+kaminari
    @q = Customer.ransack(params[:q])
    @customers = @q.result.page(params[:page])
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
    respond_to do |format|
      if @customer.update(customer_params)
        format.html {
          redirect_to @customer,
          notice: 'Customer was successfully updated.'
        }
        # format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        # format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
      :company_id,
      :post_id
    )
  end
end
