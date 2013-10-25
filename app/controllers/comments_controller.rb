class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @commentable
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to @commentable, notice: "Comment deleted."}
      end
    end
  end


private

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
    #same as post/project.find(id)
  end

