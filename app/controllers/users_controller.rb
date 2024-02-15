# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[]

  def new
  	@user = User.new(user_params)
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: { user_details: user, status: :ok }
    else
      render json: { error: 'Unable to create user', status: :unprocessable_entity }
    end
  end

  def update
    if user.update(user_params)
      render json: { user_details: user, status: :ok }
    else
      render json: { error: 'Unable to update user details', status: :unprocessable_entity }
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User deleted successfully', status: :ok }
    else
      render json: { error: 'Unable to update user details', status: :unprocessable_entity }
    end
  end

  def login
  	user = User.find_by_email(params[:email])
  	if params[:email] == user.email && params[:params] == user.password
      render json: { message: 'User logged in successfully', status: :ok }
  	end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :mobile)
  end

  def set_user
    @user = User.find_by(params[:id])
    return unless @user.nil?

    render json: { error: "Unable to find user with #{params[:id]}", status: :not_found }
  end
end
