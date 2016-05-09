class ArticlesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' created"

    redirect_to @article
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated"
    redirect_to @article
  end

  def destroy
    @article.destroy

    flash.notice = "Article '#{@article.title}' deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
end
