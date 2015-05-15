class LineItem < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :music

def total_price
product.price * quantity
end
end
