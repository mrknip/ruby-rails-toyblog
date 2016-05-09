class CommentsController < ApplicationController
  # Unregistered users only able to create new comments (Jumpstart labs' idea, not mine!)
  before_action :require_login, except: [:create]

  include CommentsHelper

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save

    redirect_to article_path(@comment.article, anchor: "comment_#{@comment.id}")
  end
end
