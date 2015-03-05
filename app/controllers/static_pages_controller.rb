class StaticPagesController < ApplicationController
	
	before_action :age

	def home
		@name  = 'Yogi Priyo'
	end

	def about
		render 'home', layout: 'about'
	end

	def age
		@age = 17
	end
end
