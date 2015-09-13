class PagesController < ApplicationController
	layout 'frontend'
	def show
		@page = Page.friendly.find params[:id]
	end
end
