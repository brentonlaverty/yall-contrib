class FrontpageController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@prompts = Prompt.all
	end
end
