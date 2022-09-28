class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
      end

    #   def create
    #     spices = Spice.create(spice_params)
    #     render json: spices, status: :created
    #   end

      def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
      end

      def destroy 
        spice = find_spice
        spice.destroy
        head :no_content

      end

      def update 
        spice =find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "Could not find spree. please  try again"}, status: :not_found
        end

      end

      private

      def spice_params
        params.permit(:title, :image, :description, :notes, :rating)

      end
      def find_spice
        Spice.find(params[:id])
    end
end
