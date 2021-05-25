module Api
  module V1
    class AirlinesController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        airlines = Airline.all
        render json: AirlineSerializer.new(airlines).serialized_json
      end
      
      # GET /api/v1/airlines/:slug
      def show
      
        airline = Airline.find_by(sluge: params[:sluge])
        render json: AirlineSerializer.new(airline).serialized_json
        
      end

      # POST /api/v1/airlines
      def create
        airline = Airline.new(airline_params)

        if airline.save
          render json: AirlineSerializer.new(airline).serialized_json
        else
          render json: errors(airline), status: 422
        end
      end

      # PATCH /api/v1/airlines/:slug
      def update
        airline = Airline.find_by(sluge: params[:sluge])

        if airline.update(airline_params)
          render json: AirlineSerializer.new(airline).serialized_json
        else
          render json: errors(airline), status: 422
        end
      end
      def destroy
        airline = Airline.find_by(sluge: params[:sluge])
      
        if airline.destroy
          head :no_content
        else
          render json: errors(airline), status: 422
        end
      end

      private
      
      def airline_params
        params.require(:airline).permit(:name, :image_url)
      end
    
    
    end
  end
end
