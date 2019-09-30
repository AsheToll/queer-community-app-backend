class CategoriesController < ApplicationController
     # before_action :find_category, only: [:show, :edit, :update]
     skip_before_action :authorized

     def index
        categories = Category.all
        render json: categories.to_json(category_serializer)
    end

    def show
        category = Category.find(params[:id])
        render json: category.to_json(category_serializer)
    end

    def create
        category = Category.create(category_params)
        render json: category.to_json(category_serializer)
    end

    def edit
    end

    def update
        category = Category.find(params[:id])
        category.update(category_params)
    end

    def destroy
        categories = Category.all
        category = Category.find(params[:id])
        if !!category
            category.destroy
        end
        render json: categories.to_json(category_serializer)
    end

    private

    # def find_category
    #     category = Category.find(params[:id])
    # end

    def category_params
        params.require(:category).permit(:name)
    end

    def category_serializer
        {
            except: [:created_at, :updated_at]
        }
    end
end
