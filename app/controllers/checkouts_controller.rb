class CheckoutsController < ApplicationController
    before_action :authenticate_user!
    before_action :initialize_session
    before_action :load_cart

    def show
        count = 0
        current_user.set_payment_processor :stripe
        current_user.payment_processor.customer

        @checkout_session = current_user
        .payment_processor
        .checkout(
            mode: 'payment',
            line_items: [{}],
            success_url: checkout_success_url,
        )
    end

    def success

    end
end
