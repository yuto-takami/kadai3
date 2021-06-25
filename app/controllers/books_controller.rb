class BooksController < ApplicationController
    
 def index
  @user = current_user
  @book = Book.new
  @books = Book.all
 end
 
 def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
   else
      @books = Book.all
      @user = current_user
      render :index
   end
 end
 
 def show
   @user = current_user
   @book = Book.new
   @books = Book.find(params[:id])
 end
 
 def edit
   @book = Book.find(params[:id])
 end
 
 def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
   else
      render :edit
   end
 end
 
 def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
 end
 
 
 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end
end