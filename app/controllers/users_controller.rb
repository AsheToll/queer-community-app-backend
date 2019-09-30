class UsersController < ApplicationController
    # before_action :find_user, only: [:show, :edit, :update]
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: users.to_json(user_serializer)
    end

    def show
        token = request.headers["Authentication"].split(" ")[1]
        render json: User.find(decode(token)["user_id"]), status: :accepted
    end

    def profile
        render json: current_user.to_json(user_serializer), status: :accepted
    end

    def create
        user = User.create!(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: {user: UserSerializer.new(user), token: token}, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
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
        params.require(:user).permit(:name, :username, :password)
    end

    def user_serializer
        {
            except: [:created_at, :updated_at]
        }
    end
end