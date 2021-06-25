class UsersController < ApplicationController
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = 'Welcome! You have signed up successfully.'
       redirect_to book_path(@book.id)
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = 'You have updated user successfully.'
       redirect_to user_path(@user.id)
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end

