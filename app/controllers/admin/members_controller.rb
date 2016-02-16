class Admin::MembersController < ApplicationController
	def index
		@members = Member.all
	end

	def new
	end

	def create
		@member = Member.new(member_params)
		@member.save
		redirect_to action: :index
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
			redirect_to action: :index
		else
			render 'edit'
		end
	end

	def destroy
		@member = Member.find(params[:id])
		@member.destroy

		redirect_to action: :index
	end


	private
		def member_params
			params.require(:member).permit(:name,:email,:phone,:role,
				:active_start,:active_end,:image,:birthday)
		end
end
