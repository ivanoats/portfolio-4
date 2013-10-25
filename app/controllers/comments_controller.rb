class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_commentable


  def index
    @comments = @commentable.comments
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @commentable
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

private

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
    #same as post/project.find(id)
  end
end
