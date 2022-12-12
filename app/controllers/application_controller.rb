class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :initialize_session
    before_action :load_cart

    def initialize_session
        session[:cart] ||= []
        session[:quantity] ||= []
        session[:checkout_payment_id] ||= ""
        session[:new_order] ||= nil
    end

    def load_cart
        @cart = Cocktail.find(session[:cart])
    end

    def remove_from_cart
        id = params[:id].to_i
        session[:cart].delete(id)
        redirect_to root_path
    end

    def edit_quantity
        index = session[:cart].index(params[:id].to_i)
        puts index
        puts params[:quantity]
        session[:quantity][index] = params[:quantity]
    end
end
