class CheckoutsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart
  Stripe.api_key = 'sk_test_51MClOoIFgMFAypoN9JWYH4wmanfYbGJQTNeKFKEvNo1TqByg0ugKySWISQbTtZnmXpg4dDPy7GxWP8GbKKD6hUq400aCeLOaFk'

  def show   
    item_list = []

    session[:cart].each_with_index do |i, index|
      item = Cocktail.find(i)
      item_list.append(
      {       
        price_data: {
          currency: 'cad',
          unit_amount: item.price,
          product_data: {
            name: item.cocktail_name,
          },
          tax_behavior: 'exclusive',
        },
        quantity: session[:quantity][index]
      })
    end

    domain = 'http://localhost:3000/'
    checkout_session = Stripe::Checkout::Session.create({
      # line_items: [{
      #   price: 'price_1MDCa6IFgMFAypoNwvZtQPKV',
      #   quantity: 1,
      # }],
      line_items: item_list,
      mode: 'payment',
      success_url: domain + 'success',
      cancel_url: domain,
      shipping_address_collection: {allowed_countries: ['CA']},
      automatic_tax: {enabled: true},
    })

    puts "id:" + checkout_session.id

    session[:checkout_payment_id] = checkout_session.id

    puts "session:" + session[:checkout_payment_id]
    redirect_to checkout_session.url, allow_other_host: true
  end

  def success
    if !session[:cart].empty?
      checkout_session = Stripe::Checkout::Session.retrieve(
        session[:checkout_payment_id].to_s
      )

      @payment_id = checkout_session.payment_intent

      payment_intent = Stripe::PaymentIntent.retrieve(
        @payment_id
      )

      address = "#{payment_intent.shipping.address.line2} #{payment_intent.shipping.address.line1} #{payment_intent.shipping.address.city} #{payment_intent.shipping.address.state} #{payment_intent.shipping.address.postal_code}, #{payment_intent.shipping.address.country}"

      order = current_user.orders.create(
        payment: @payment_id,
        total_price: payment_intent.amount,
        address: address,  
      )

      puts "order:" + order.to_s

      session[:cart].each_with_index do |i, index|
        order.order_items.create(
          cocktail: Cocktail.find(i),
          price: Cocktail.find(i).price,
          quantity: session[:quantity][index],
        )
      end

      current_user.update(address: address)

      session[:new_order] = order.id
      session[:cart] = []
      session[:quantity] = []
    end

    @total_amount = Order.find(session[:new_order].to_i).total_price / 100.0
    @order_items = OrderItem.where("order_id LIKE ? ", session[:new_order].to_i)
  end
end