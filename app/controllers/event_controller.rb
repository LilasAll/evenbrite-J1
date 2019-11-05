class EventController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def index
	end

	def show
					@event = Event.find_by(id:params[:id])
	end

	def new
		@event = Event.new
	end

	def create 
		#crée un event avec tous les paramètres
		@event = Event.new(admin: current_user,
			title: params[:title],
			start_date: params[:start_date],
			duration: params[:duration],
			description: params[:description],
			price: params[:price],
			location: params[:location],
			)

		if @event.save
			flash[:success] = "Evenement créé !"
			#Retourne à la page d'acceuil
			redirect_to '/'
		else
    	#Reste sur la page de création
    	render 'new' 
    end
  end

	def destroy
  	@event= Event.find_by(id:params[:id])
  	if @event.destroy
  	redirect_to "/"
  	end
	end

end
