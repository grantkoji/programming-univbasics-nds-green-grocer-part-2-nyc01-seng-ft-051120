require_relative './part_1_solution.rb'
require 'pry'



def apply_coupons(cart, coupons)
    consolidated_cart = cart
    coupons.each do |coupon_info|
      binding.pry
    coupon_price = coupon_info[:cost] / coupon_info[:num]
    coupon_name = "#{coupon_info[:item]} W/ COUPON"
    coupon_count = coupon_info[:num]
    consolidated_cart.each do |consolidated_cart_info|
      consolidated_count = consolidated_cart_info[:count|
        if coupon_info[:item] == consolidated_cart_info[:item]
          if consolidated_count - coupon_count == 0
            consolidated_cart_info[:count] = 0
            consolidated_cart << { :item => coupon_name,
                                   :price => coupon_price,
                                   :clearance => consolidated_cart_info[:clearance],
                                   :count => coupon_count
                                 }
          elsif consolidated_count - coupon_count < 0
            consolidated_cart_info[:count] = 0
            consolidated_cart << { :item => coupon_name,
                                   :price => coupon_price,
                                   :clearance => consolidated_cart_info[:clearance],
                                   :count => coupon_count - consolidated_count
                                 }
          else
            consolidated_cart_info[:count] = consolidated_count - coupon_count
            consolidated_cart << { :item => coupon_name,
                                   :price => coupon_price,
                                   :clearance => consolidated_cart_info[:clearance],
                                   :count => coupon_count
                                 }
          end
        end
      end
  end
  consolidated_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
