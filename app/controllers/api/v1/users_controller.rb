module Api
  module V1
    class UsersController < ApplicationController
      def validate
        user_id = request.headers['X-Reminder-Session-Token']

        user = User.by_user_id(user_id)
        return not_authenticated if user.size == 0

        respond_with_json user.first
      end

      def login
        user = User.by_login(params['username'], params['password'])
        return not_found('user not found') if user.size == 0

        respond_with_json user.first
      end

      def find
        users = User.by_hash(params['where'])
        respond_with_jsons users
      end

      def getToken
        data = JSON.parse(request.body.read)
        user_id = request.headers['X-Reminder-Session-Token']

        user = User.by_user_id(user_id).first
        user.token = data['token']
        user.save

        respond_with_json({:success => true})
      end

      def setup
        data = JSON.parse(request.body.read)
        user = User.create(
          username: data['username'],
          password: data['password'],
          email: data['email'],
          locale: data['locale'],
          locked: data['locked']
        )

        respond_with_json({:success => true})
      end
    end
  end
end