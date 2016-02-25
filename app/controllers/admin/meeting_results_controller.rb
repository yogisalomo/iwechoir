class Admin::MeetingResultsController < ApplicationController
	layout "admin"

	def index
		@meeting_results = MeetingResult.all()
	end

	def show
		@meeting_result = MeetingResult.find(params[:id])
	end

	def new
	end

	def create
		@meeting_result = MeetingResult.create(meeting_result_params)
		@meeting_result.save

		redirect_to action: :index
	end

	def edit
		@meeting_result = MeetingResult.find(params[:id])
	end

	def update
		@meeting_result = MeetingResult.find(params[:id])
		if @meeting_result.update(meeting_result_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end

	def destroy
		@meeting_result = MeetingResult.find(params[:id])
		@meeting_result.destroy

		redirect_to action: :index
	end

	private
		def meeting_result_params
			params.require(:meeting_result).permit(:date, :location, :summary, :user_id)
		end
end
