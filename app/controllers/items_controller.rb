class ItemsController < ApplicationController
end
class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    Item.create(name: item_params[:name], price: item_params[:price], image: item_params[:image], user_id: current_user.id, description: item_params[:description], hoslink: item_params[:hoslink], hostime: item_params[:hostime], showlist1: item_params[:showlist1], showlistmiddle: item_params[:showlistmiddle], showlistbottom: item_params[:showlistbottom])
    redirect_to action: :index
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def show
    # @itemというインスタンス変数を用意する
    @item = Item.find_by(id: params[:id])
  end



  def destroy
    item = Item.find(params[:id])
    item.delete
    redirect_to action: :index
  end








private
def item_params
    params.require(:item).permit(:name, :price, :image, :description, :hoslink, :hostime, :showlist1, :showlistmiddle, :showlistbottom)
  end



end
