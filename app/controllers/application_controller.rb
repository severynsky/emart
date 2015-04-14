class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_cart


  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end
end
