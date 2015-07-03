class PromptsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@prompts = Prompt.all
	end

	def new
		@prompt = Prompt.new
	end

	def show
	  @prompt = Prompt.find(params[:id])
	  @unpublished_contribs = @prompt.contribs.where(is_published: false)	  
	  @published_contribs = @prompt.contribs.where(is_published: true)
	  @contribs = @prompt.contribs
	  # @contribs = @prompt.contribs.where(is_published: false)
	end

	def create
		@prompt = Prompt.new(params.require(:prompt).permit(:headline, :body, :image_url, :is_published).merge(user: current_user))

		if @prompt.save
			redirect_to root_path, notice: "Contribed!!"
		else
			render :new
		end
		
	end

	def destroy
	  Prompt.find(params[:id]).destroy
	  redirect_to root_path, notice: "Unpublished!"
	end

	def publish
	  Prompt.find(params[:id]).update_attributes(is_published: true)

	  redirect_to root_path, notice: "Published!"
	end


	def set_prompt
		@prompt = Prompt.find(params[:id])
	end

end
