class Admin::VideosController < ApplicationController
	layout "admin"
	def index
		@videos = Video.all()
	end

	def show
		@video = Video.find(params[:id])
	end

	def new
	end

	def create
		@video = Video.new(video_params)
		@video.save

		redirect_to action: :index
	end

	def edit
		@video = Video.find(params[:id])
	end

	def update
		@video = Video.find(params[:id])
		if @video.update(video_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end

	def destroy
		@video = Video.find(params[:id])
		@video.destroy

		redirect_to action: :index
	end

	private
		def video_params
			params.require(:video).permit(:url,:user_id)
		end
end
