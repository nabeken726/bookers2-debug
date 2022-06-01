class BookCommentsController < ApplicationController

def create

  @book = Book.find(params[:book_id])
  @book_comment = BookComment.new
  comment = current_user.book_comments.new(book_comment_params)
  comment.book_id = @book.id
  comment.save
  render :create
end

def destroy
  @book = Book.find(params[:book_id])
  @book_comment = current_user.book_comments.find_by(book_id: @book.id)
  @book_comment.destroy
  render :destroy
end


private

def book_comment_params
  params.require(:book_comment).permit(:comment)
end
end
