class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top]
 
def new
end

def index
  @user = current_user
  @book = Book.new
  @books = Book.all
end

def show
  @user = current_user
  @Book =  Book.find(params[:id])
  @users = @Book.user
  @book = Book.new
  @books = Book.all
end
  
  
def create
  @Book = Book.new(book_params)
  @Book.user_id = current_user.id
  @Book.save
  flash[:notice] = "successfully"
  redirect_to book_path(@Book)
end


def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
end

 def edit
  @book = Book.find(params[:id])
 end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(book.id)  
  end
  
  
private

def book_params
  params.require(:book).permit(:title, :body)
end

end
