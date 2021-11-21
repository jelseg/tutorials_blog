class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy ]
    before_action :require_admin, except: [:index, :show]

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            flash[:notice] = "category #{@category.name} was created"
            redirect_to @category
        else
            render 'new'
        end
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 10)
    end

    def show

    end


    private 

        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.require(:category).permit(:name)
        end

        def require_admin
            if !(logged_in? && current_user.admin?) 
                flash[:alert] = "only admins can modify categories"
                redirect_to categories_path
            end
        end
end