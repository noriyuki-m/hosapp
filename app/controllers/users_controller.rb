class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    # 投稿完了後、すぐに一覧表示画面へ遷移
    redirect_to :action => :index
  end
  
  def index
    @users = User.all
  end


  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end



  private
  def user_params
    params.require(:user).permit(:image)
  end
end
