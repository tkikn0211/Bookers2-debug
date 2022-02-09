class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    render 'book_comments/create'#非同期通信jsファイル指定
    #redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comments = current_user.book_comments.find_by(book_id: @book.id)
    @book_comments.destroy
    render 'book_comments/destroy'#非同期通信jsファイル指定
    #redirect_to request.referer
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
