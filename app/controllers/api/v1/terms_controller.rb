module Api
  module V1
    class TermsController < ApplicationController
      def find
        terms = Term.by_hash(params['where'])
        respond_with_jsons terms
      end
    end
  end
end