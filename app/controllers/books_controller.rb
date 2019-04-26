class BooksController < ApplicationController
  def index
    puts "------------------ここがパラメータです"
    puts params

    if params[:title].blank?
      @books = Book.all
    else
      @books = Book.where(title: params[:title])
    end
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to(book_path(book.id))
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to(book_path(book.id))
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to(books_path)
  end

  private
  
  def book_params
    params.require(:book).permit(:title)
  end
end
