class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: :index

  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    else
      # 商品の購入ページを表示する処理を追加
      @purchase_address = PurchaseAddress.new
    end
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :region_id, :city, :street_address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
