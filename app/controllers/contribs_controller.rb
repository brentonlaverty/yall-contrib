class ContribsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@prompt = Prompt.find(params[:prompt_id])		
		@contribs = @prompt.contribs
	 	@unpublished_contribs = @prompt.contribs.where(is_published: false)	  
	 	@published_contribs = @prompt.contribs.where(is_published: true)
	 	@contribs = @prompt.contribs		
	end

	def new
		@prompt = Prompt.find(params[:prompt_id])
		@contrib = Contrib.new
	end

	def show
	  @contrib = Contrib.find(params[:id])	
	end

	def create
		@contrib = Contrib.new(params.require(:contrib).permit(:headline, :body, :image_url, :is_published).merge(user: current_user, prompt_id: params[:prompt_id]))

		if @contrib.save
			redirect_to root_path, notice: "Contribed!!"
		else
			render :new
		end
		
	end

   def destroy
	  session[:return_to] ||= request.referer   	
	  Contrib.find(params[:id]).destroy
	  redirect_to session.delete(:return_to), notice: "Contrib Deleted!"
   end

   def publish_contrib
		session[:return_to] ||= request.referer   		     	
		#Contrib.find(params[:id]).update_attributes(is_published: true)
		#redirect_to root_path, notice: "Published!!"
		@contrib = Contrib.find(params[:id])
		@contrib.is_published = true
		@contrib.save
		redirect_to session.delete(:return_to), notice: "Contrib Published!"
   end

   def unpublish_contrib
	  session[:return_to] ||= request.referer   		     	
      #Contrib.find(params[:id]).update_attributes(is_published: true)
	  #redirect_to root_path, notice: "Published!!"
	  @contrib = Contrib.find(params[:id])
	  @contrib.is_published = false
	  @contrib.save
	  redirect_to session.delete(:return_to), notice: "Contrib Unpublished!"
   end

end