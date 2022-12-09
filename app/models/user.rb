class User < ApplicationRecord
    has_many :orders
    has_one :cart

    validates :username, :user_email, :user_password, :user_dob, presence: true
    validates :user_password, length: { minimum: 6 }
    validates :email, :username, uniqueness: true
    validates :email, format: {^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$, message:"not an email"}

    pay_customer stripe_attributes: :stripe_attributes

    def stripe_attributes(pay_customer)
        {
            address: {
                city: pay_customer.owner.city,
                country: pay_customer.owner.country
            },
            metadata: {
                pay_customer_id: pay_customer.id
                user_id: id
            }
        }
    end
end
