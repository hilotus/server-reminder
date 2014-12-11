module Api
  module V1
    class UsersController < ApplicationController

      def validate
        token = request.headers['X-Reminder-Session-Token']

        user = User.where(:id => token).first or return not_authenticated

        respond_with user
      end
    end

  end
end