module Api
  module V1
    class EventsController < ApplicationController

      def find
        user = params[:where]
        event = Event.by_hash(user:user)
        respond_with_jsons event
      end

      def create
        event = JSON.parse request.body.read
        Event.create event
        respond_with_json event
      end

    end
  end
end