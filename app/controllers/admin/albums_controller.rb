class Admin::AlbumsController < ApplicationController
	layout "admin"

	def index
		@albums = Album.all()
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
	end

	def create
		@album = Album.new(album_params)
		@album.save

		redirect_to action: :index
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(album_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end

	def destroy
		@album = Album.find(params[:id])
		@album.destroy

		redirect_to action: :index
	end

	private
		def album_params
			params.require(:album).permit(:name,:description,:user_id)
		end
end
