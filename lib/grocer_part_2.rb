require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]
    if item_is_in_basket and count_is_big_enough_to_apply
      cart << { item: "#{item_with_coupon[:item]} W/COUPON",
                price: coupon[:cost] / coupon[:num],
                clearance: item_with_coupon[:clearance],
                count: coupon[:num]
              }
      item_with_coupon[:count] -= coupon[:num]
      binding.pry
    end
  end
  cart
end



#def apply_coupons(cart, coupons)
#    consolidated_cart = cart
#    coupons.each do |coupon_info|
#    coupon_price = coupon_info[:cost] / coupon_info[:num]
#    coupon_name = "#{coupon_info[:item]} W/ COUPON"
#    coupon_count = coupon_info[:num]
#    consolidated_cart.each do |consolidated_cart_info|
#      consolidated_count = consolidated_cart_info[:count|
#        if coupon_info[:item] == consolidated_cart_info[:item]
#          if consolidated_count - coupon_count == 0
#            consolidated_cart_info[:count] = 0
#            consolidated_cart << { :item => coupon_name,
#                                   :price => coupon_price,
#                                   :clearance => consolidated_cart_info[:clearance],
#                                   :count => coupon_count
#                                 }
#          elsif consolidated_count - coupon_count < 0
#            consolidated_cart_info[:count] = 0
#            consolidated_cart << { :item => coupon_name,
#                                   :price => coupon_price,
#                                   :clearance => consolidated_cart_info[:clearance],
#                                   :count => coupon_count - consolidated_count
#                                 }
##          else
  #          consolidated_cart_info[:count] = consolidated_count - coupon_count
  #          consolidated_cart << { :item => coupon_name,
  #                                 :price => coupon_price,
  #                                 :clearance => consolidated_cart_info[:clearance],
  #                                 :count => coupon_count
  #                               }
  #        end
  #      end
  #    end
  #end
  #consolidated_cart
#end

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
