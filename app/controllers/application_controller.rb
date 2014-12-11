class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json

  rescue_from Exception, with: :catch_exception

  def catch_exception(ex)
    respond_with({:error => ex.message}, :status => 500)
  end

  protected
    def not_found
      respond_with({:error => "not-found"}, :status => 404)
    end

    def not_authenticated
      respond_with({:error => "not-authenticated"}, :status => 401)
    end

end
