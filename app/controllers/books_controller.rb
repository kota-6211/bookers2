class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
    @books = Book.all
    @user = current_user
    render 'index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find_by(id: params[:id])
    @user = @book.user
  end
  def destroy
    @book = Book.find(params[:id]) 
    flash[:notice] = "Book was successfully destroyed."
    @book.destroy  
    redirect_to books_path
  end
  def edit
    @book = Book.find_by(id: params[:id])
    @user = current_user
    if @book.user_id == current_user.id
      render "edit"
    else
      redirect_to books_path
    end
  end
  def update
     @book = Book.find_by(id: params[:id])
   if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book)
   else
     render 'edit'
   end
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
