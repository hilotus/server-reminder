module Api
  module V1
    class TermsController < ApplicationController
      def find
        if params['where'].nil?
          terms = Term.by_creator(params['creator'])
        else
          terms = Term.by_hash(params['where'])
        end
        respond_with_jsons terms
      end
    end
  end
end