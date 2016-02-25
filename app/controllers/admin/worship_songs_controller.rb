class Admin::WorshipSongsController < ApplicationController
	layout "admin"
	def index
		@worship_songs = WorshipSong.all()
	end

	def show
		@worship_song = WorshipSong.find(params[:id])
	end

	def new
	end

	def create
		@worship_song = WorshipSong.create(worship_song_params)
		@worship_song.save

		redirect_to action: :index
	end

	def edit
		@worship_song = WorshipSong.find(params[:id])
	end

	def update
		@worship_song = WorshipSong.find(params[:id])
		if @worship_song.update(worship_song_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end

	def destroy
		@worship_song = WorshipSong.find(params[:id])
		@worship_song.destroy

		redirect_to action: :index
	end

	private
		def worship_song_params
			params.require(:worship_song).permit(:title,:text,:file,:user_id)
		end

end
