class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
     flash[:notice] = 'successfully completed'
     redirect_to book_path(@book.id)
  else
    flash.now[:alert] = 'Update error'
    render :index
  end
 end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @books = Book.all
    if @book.update(book_params)
     flash[:notice] = 'successfully completed'
     redirect_to book_path(@book.id)
   else
    flash.now[:alert] = 'Update error'
    render :index
   end
  end
 
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
