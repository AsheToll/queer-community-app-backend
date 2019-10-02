class EventAttendeesController < ApplicationController
    # before_action :find_event_attendee, only: [:show, :edit, :update]
    skip_before_action :authorized

    def index
        event_attendees = EventAttendee.all
        render json: event_attendees.to_json(event_attendee_serializer)
    end

    def show
        event_attendee = EventAttendee.find(params[:id])
        render json: event_attendee.to_json(event_attendee_serializer)
    end

    def create
        event_attendee = EventAttendee.create(event_attendee_params)
        render json: event_attendee.to_json(event_attendee_serializer)
    end

    def edit
    end

    def update
        event_attendee = EventAttendee.find(params[:id])
        event_attendee.update(event_attendee_params)
    end

    def destroy
        event_attendee = EventAttendee.find(params[:id])
        event_attendee.destroy
        render json: event_attendees.to_json(event_attendee_serializer)
    end

    private

    # def find_event_attendee
    #     event_attendee = EventAttendee.find(params[:id])
    # end

    def event_attendee_params
        params.require(:event_attendee).permit(:attendee_id, :event_id)
    end

    def event_attendee_serializer
        {
            include: {
                :attendee => {
                    except: [:created_at, :updated_at]
                },
                :event => {
                    except: [:created_at, :updated_at]
                }
            },
            except: [:created_at, :updated_at]
        }
    end
end
