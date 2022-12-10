require 'stripe'

class ApplicationController < ActionController::Base
    before_action :initialize_session
    before_action :load_cart

    def initialize_session
        session[:cart] ||= []
        session[:quantity] ||= []
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

    # def checkout
    #     Stripe.api_key = 'sk_test_51MClOoIFgMFAypoN9JWYH4wmanfYbGJQTNeKFKEvNo1TqByg0ugKySWISQbTtZnmXpg4dDPy7GxWP8GbKKD6hUq400aCeLOaFk'
    #     item_list = []

    #     session[:cart].each_with_index do |i, index|
    #     item = Cocktail.find(i)
    #     item_list.append(
    #     {       
    #         price_data: {
    #         currency: 'cad',
    #         unit_amount: item.price,
    #         product_data: {
    #             name: item.cocktail_name,
    #         },
    #         tax_behavior: 'exclusive',
    #         },
    #         quantity: session[:quantity][index]
    #     })
    #     end

    #     domain = 'http://localhost:3000/'
    #     session = Stripe::Checkout::Session.create({
    #     # line_items: [{
    #     #   price: 'price_1MDCa6IFgMFAypoNwvZtQPKV',
    #     #   quantity: 1,
    #     # }],
    #     line_items: item_list,
    #     mode: 'payment',
    #     success_url: domain + 'success',
    #     cancel_url: domain,
    #     shipping_address_collection: {allowed_countries: ['US', 'CA']},
    #     automatic_tax: {enabled: true},
    #     })
    #     redirect_to session.url, allow_other_host: true
    # end

    # helper_method :checkout
end
