class UsersController < ApplicationController
#   rescue_from ActiveRecord::RecordInvalid, with: :render_not_found_response 
#   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        user = User.find(session[:user_id])
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:username, :image_url, :bio, :password_confirmation, :password)
    end

    def record_not_found
        render json: { error: "Not authorized" }, status: :unauthorized
    end

    # def render_not_found_response(e)
    #     render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    # end
end
