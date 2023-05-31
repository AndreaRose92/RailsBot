class TasksController < ApplicationController
  def create
    user = User.find_or_create_by(name: params[:user])
    Task.create(content: params[:content], notes: params[:notes], user: user)
  end
end
