class EventCreatorsController < ApplicationController
    # before_action :find_event_creator, only: [:show, :edit, :update]
    skip_before_action :authorized

    def index
        event_creators = EventCreator.all
        render json: event_creators.to_json(event_creator_serializer)
    end

    def show
        event_creator = EventCreator.find(params[:id])
        render json: event_creator.to_json(event_creator_serializer)
    end

    def create
        event_creator = EventCreator.create(event_creator_params)
        render json: event_creator.to_json(event_creator_serializer)
    end

    def edit
    end

    def update
        event_creator = EventCreator.find(params[:id])
        event_creator.update(event_creator_params)
    end

    def destroy
        event_creator = EventCreator.find(params[:id])
        event_creator.destroy
        render json: event_creators.to_json(event_creator_serializer)
    end

    private

    # def find_event_creator
    #     event_creator = EventCreator.find(params[:id])
    # end

    def event_creator_params
        params.require(:event_creator).permit(:creator_id, :event_id)
    end

    def event_creator_serializer
        {
            include: {
                :creator => {
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
