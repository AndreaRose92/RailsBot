class UsersController < ApplicationController
  def show
    render json: User.find_by(name: params[:name])
  end

  def create
    user = User.create(params[:name])
  end
end
