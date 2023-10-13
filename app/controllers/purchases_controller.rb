class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    else
      # 商品の購入ページを表示する処理を追加
      @purchase_address = PurchaseAddress.new
    end
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :region_id, :city, :street_address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
