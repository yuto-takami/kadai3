class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Books.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = 'You have created book successfully.'
       redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
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
    if @book.destroy
      redirect_to
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
