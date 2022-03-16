class PlantsController < ApplicationController


    def index
        plants = Plant.all 
        render json: plants, status: :ok 
    end

    def show 
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json: plant, status: :ok
        else
            render json: {error: "plant not found"}, status: :not_found
        end

    end


    def create
        plant = Plant.create(params.permit(:name, :image, :price))
        render json: plant, status: :created
      end
end
