class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @post
    else
      render template: "posts/show"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment Approved"
      redirect_to @comment.post
    else
      @post = @comment.post
      render template: "posts/show"
    end
  end
end
