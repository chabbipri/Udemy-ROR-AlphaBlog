class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit destroy update]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(permit_params)
    if @article.save
      flash[:notice] = "The Article was created Successfully."
      redirect_to @article
    else
      render :new
    end
  end

  def update
    if @article.update(permit_params)
      flash[:notice] = "The Article was successfully updated."
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    flash[:alert] = "The Article was successfully deleted."
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find_by(id: params[:id])
  end

  def permit_params
    params.require(:article).permit(:title, :description)
  end
end
