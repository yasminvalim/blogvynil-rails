class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]
  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end


  def show
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to article_path(@article)
    else
      flash[:notice] = "Article was not updated"
      render 'edit'
    end
  end

  def edit
  end

  def index
    @articles = Article.order(created_at: :desc ).page params[:page]
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end

  private

  def verify_user
    if current_user != @article.user
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
