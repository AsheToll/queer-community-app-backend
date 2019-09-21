class EventsController < ApplicationController
    # before_action :find_event, only: [:show, :edit, :update]

    def index
        events = Event.all
        render json: events.to_json(event_serializer)
    end

    def show
        event = Event.find(params[:id])
        render json: event.to_json(event_serializer)
    end

    def create
        event = Event.create(event_params)
        render json: event.to_json(event_serializer)
    end

    def edit
    end

    def update
        event = Event.find(params[:id])
        event.update(event_params)
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy
        render json: events.to_json(event_serializer)
    end

    private

    # def find_event
    #     event = Event.find(params[:id])
    # end

    def event_params
        params.require(:event).permit(:name, :image, :location_id, :description)
    end

    def event_serializer
        {
            except: [:created_at, :updated_at],
            include: {
                :location => {
                    except: [:created_at, :updated_at]
                },
                :attendees => {
                    except: [:created_at, :updated_at]
                }
            }
        }
    end
end