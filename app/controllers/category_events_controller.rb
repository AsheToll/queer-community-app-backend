class CategoryEventEventsController < ApplicationController
    # before_action :find_category_event, only: [:show, :edit, :update]

    def index
        category_events = CategoryEvent.all
        render json: category_events.to_json(category_event_serializer)
    end

    def show
        category_event = CategoryEvent.find(params[:id])
        render json: category_event.to_json(category_event_serializer)
    end

    def create
        category_event = CategoryEvent.create(category_event_params)
        render json: category_event.to_json(category_event_serializer)
    end

    def edit
    end

    def update
        category_event = CategoryEvent.find(params[:id])
        category_event.update(category_event_params)
    end

    def destroy
        category_events = CategoryEvent.all
        category_event = CategoryEvent.find(params[:id])
        if !!category_event
            category_event.destroy
        end
        render json: category_events.to_json(category_event_serializer)
    end

    private

    # def find_category_event
    #     category_event = CategoryEvent.find(params[:id])
    # end

    def category_event_params
        params.require(:category_event).permit(:category_id, :event_id)
    end

    def category_event_serializer
        {
            except: [:created_at, :updated_at]
        }
    end
end
