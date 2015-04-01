class StaticPagesController < ApplicationController
	
	#untuk selalu memanggil variable age setiap kali memanggil halaman
	before_action :age

	def home
		#@name  = params['name']
    #@places = Place.all
    @places = Place.limit(8)
	end

	def about
		render 'home', layout: 'about'
	end

	def age
		@age = 17
	end
end
