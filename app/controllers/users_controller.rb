class UsersController < ApplicationController
    # before_action :find_user, only: [:show, :edit, :update]

    def index
        users = User.all
        render json: users.to_json(user_serializer)
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(user_serializer)
    end

    def create
        user = User.create(user_params)
        render json: user.to_json(user_serializer)
    end

    def edit
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: users.to_json(user_serializer)
    end

    private

    # def find_user
    #     user = User.find(params[:id])
    # end

    def user_params
        params.require(:user).permit(:name, :username)
    end

    def user_serializer
        {
            except: [:created_at, :updated_at]
        }
    end
end