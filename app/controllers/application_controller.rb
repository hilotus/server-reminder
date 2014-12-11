class ApplicationController < ActionController::Base
  protect_from_forgery

  # Rails shows “WARNING: Can't verify CSRF token authenticity” from a RestKit POST
  # http://stackoverflow.com/questions/10167956/rails-shows-warning-cant-verify-csrf-token-authenticity-from-a-restkit-post
  skip_before_filter :verify_authenticity_token

  respond_to :json

  rescue_from Exception, with: :catch_exception

  def catch_exception(ex)
    render json: {:error => ex.message}, status: 500
  end

  protected
    # return mongoid queried results as {:results => [records]}
    def respond_with_jsons(records)
      render json: {:results => records}.to_json
    end

    def respond_with_json(record)
      render json: record.to_json
    end

    def not_found(msg = nil)
      render json: {:error => msg || 'not found'}, status: 404
    end

    def not_authenticated(msg = nil)
      render json: {:error => msg || 'not authenticated'}, status: 401
    end

end
