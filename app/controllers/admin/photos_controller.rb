class Admin::PhotosController < ApplicationController
	layout "admin"
	def index
		@photos = Photo.all()
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.save

		redirect_to action: :index
	end
	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy

		redirect_to action: :index
	end

	private 
		def photo_params
			params.require(:photo).permit(:image,:user_id,:album_id)
		end
end
