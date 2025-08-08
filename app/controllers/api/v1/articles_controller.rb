class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :update, :destroy ]

  def index
    @articles = Article.all

    render json: {message: "Success", data: @articles, count: @articles.count}
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: api_v1_articles_url(@article)
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

 private

 def article_params
    params.require(:article).permit(:article_number, :body, :title)
 end

 def set_article
    @article = Article.find(params[:id])
 end
end

