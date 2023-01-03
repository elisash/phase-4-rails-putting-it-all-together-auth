class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # def create
  #   user = User.create!(user_params)
  #   session[:user_id] = user.id
  #   render json: user, status: :created
  # end

  # def show
  #   render json: @current_user
  # end

  # private

  # def user_params
  #   params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  # end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created

    # if user.valid?
    #   session[:user_id] = user.id
    #   render json: user, status: :created
    # else
    #   render json: { errors: user.errors.full_messages }, status: 422
    # end
  end

  def show
    render json: @current_user
    # user = User.find_by(id: session[:user_id])
    # if user
    #   render json: user, status: 201
    # else
    #   render json: { error: "Unauthorized" }, status: 401
    # end
  end

  private

  def user_params
    params.permit(
      :username,
      :password,
      :password_confirmation,
      :image_url,
      :bio,
    )
  end
end
