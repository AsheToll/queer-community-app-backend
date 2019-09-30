class LocationsController < ApplicationController
    # before_action :find_location, only: [:show, :edit, :update]
    skip_before_action :authorized

    def index
        locations = Location.all
        render json: locations.to_json(location_serializer)
    end

    def show
        location = Location.find(params[:id])
        render json: location.to_json(location_serializer)
    end

    def create
        location = Location.create(location_params)
        render json: location.to_json(location_serializer)
    end

    def edit
    end

    def update
        location = Location.find(params[:id])
        location.update(location_params)
    end

    def destroy
        location = Location.find(params[:id])
        location.destroy
        render json: locations.to_json(location_serializer)
    end

    private

    # def find_location
    #     location = Location.find(params[:id])
    # end

    def location_params
        params.require(:location).permit(:name)
    end

    def location_serializer
        {
            except: [:created_at, :updated_at]
        }
    end
end
