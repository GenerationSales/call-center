class PagesController < ApplicationController
	layout 'frontend'
	def show
		if !params[:id].nil?
			@page = Page.friendly.find params[:id]
		else
			@page = Page.friendly.find 1
		end
	end
end
