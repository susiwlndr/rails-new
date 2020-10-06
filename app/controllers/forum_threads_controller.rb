class ForumThreadsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]
	# index
	def index
		@threads = ForumThread.order(id: :desc)
	end
	# show
	def show
		@thread = ForumThread.find(params[:id])
		@post = ForumPost.new
	end

	def new
		@thread = ForumThread.new
	end

	def create
		@thread = ForumThread.new(resource_params)
		@thread.user = current_user
		if @thread.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
		@thread = ForumThread.find(params[:id])
	end

	def update
		@thread = ForumThread.find(params[:id])
		@thread.user = current_user

		if @thread.update(resource_params)
			redirect_to root_path
		else
	end
end
	
	private

	def resource_params
		params.require(:forum_thread).permit(:title, :content)
	end
end