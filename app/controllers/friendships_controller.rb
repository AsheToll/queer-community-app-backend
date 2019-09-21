class FriendshipsController < ApplicationController
    # before_action :find_friendship, only: [:show, :edit, :update]

    def index
        friendships = Friendship.all
        render json: friendships.to_json(friendship_serializer)
    end

    def show
        friendship = Friendship.find(params[:id])
        render json: friendship.to_json(friendship_serializer)
    end

    def create
        friendship = Friendship.create(friendship_params)
        render json: friendship.to_json(friendship_serializer)
    end

    def edit
    end

    def update
        friendship = Friendship.find(params[:id])
        friendship.update(friendship_params)
    end

    def destroy
        friendship = Friendship.find(params[:id])
        friendship.destroy
        render json: friendships.to_json(friendship_serializer)
    end

    private

    # def find_friendship
    #     friendship = Friendship.find(params[:id])
    # end

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end

    def friendship_serializer
        {
            except: [:created_at, :updated_at]
        }
    end
end
