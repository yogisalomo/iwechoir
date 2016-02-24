class Admin::ArticlesController < ApplicationController
	layout "admin"
	def new
	end

	def index
		@articles = Article.all()
	end
end
