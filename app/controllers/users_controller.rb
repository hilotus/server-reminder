class UsersController < ApplicationController
  def validate
    render json: User.all, content_type: "application/json"
  end
end
