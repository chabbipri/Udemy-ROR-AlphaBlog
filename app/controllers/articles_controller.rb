class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(id: params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "The Article was created Successfully."
      redirect_to @article
    else
      render :new
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "The Article was successfully updated."
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy

    flash[:alert] = "The Article was successfully deleted."
    redirect_to articles_path
  end
end
