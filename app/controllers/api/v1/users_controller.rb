module Api
  module V1
    class UsersController < ApplicationController
      def validate
        token = request.headers['X-Reminder-Session-Token']

        user = User.by_token(token).first or return not_authenticated

        respond_with user
      end

      def login
        user = User.by_login(params[:username], params[:password]).first or return not_found('user not found')

        respond_with user
      end
    end

  end
end