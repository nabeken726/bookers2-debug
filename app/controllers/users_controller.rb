class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  before_action :ensure_guest_user,only:[:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    #  投稿数
    @today_book =  @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
  end

  def index
    @users = User.all
    @book = Book.new

  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def search
    @user = User.find(params[:user_id])
    @books = @user.books
    @book = Book.new
    if params[:created_at] == ""
      #if文で分岐させて日付を選択
      @search_book = "日付を選択してください"
    else
      created_at = params[:created_at]
      #countメソッドで検索してヒットした本を投稿した日付の投稿数を@search_bookで定義
      @search_book = @books.where(['created_at LIKE ?', "#{created_at}%"]).count
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
  if @user.name == "guestuser"
    redirect_to user_path(current_user),notice:'ゲストユーザーはプロフィール編集画面へ遷移できません。'
  end
  end
end
