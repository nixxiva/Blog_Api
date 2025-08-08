class ApplicationController < ActionController::API
  def root
    render json: { message: "Welcome to the API!" }
  end
end
