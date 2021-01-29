class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit,:update]
  


  def index
    @items = Item.all
  end

  def show
    
  end
  
  def edit
    
   unless @item.user_id == current_user.id
    redirect_to action: :index
   end    
  
  end

  def update
  
    if @item.update(item_params)

    redirect_to item_path

    else

      render :edit

    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :text, :image, :category_id, :state_id, :send_fee_id, :prefecture_id,:send_period_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

 
end
