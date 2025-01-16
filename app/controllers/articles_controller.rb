class ArticlesController < ApplicationController

  def show
    @article = Article.find_by(id: params[:id])
  end

  def index
    @articles = Article.all
  end

end
