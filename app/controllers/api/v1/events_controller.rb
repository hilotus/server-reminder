module Api
  module V1
    class EventsController < ApplicationController
      def find
        events = Event.by_hash(params[:where])
        respond_with_jsons events
      end

      def create
        event = JSON.parse request.body.read
        Event.create event
        respond_with_json event
      end

    end
  end
end