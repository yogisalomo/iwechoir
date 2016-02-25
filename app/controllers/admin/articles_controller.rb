class Admin::ArticlesController < ApplicationController
	layout "admin"
	def new
	end

	def index
		@articles = Article.all()
	end

	def create
		@article = Article.new(article_params)
		@article.save

		redirect_to action: :index
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to action: :index
	end

	private
		def article_params
			params.require(:article).permit(:title,:content,:image,:user_id)
		end
end
