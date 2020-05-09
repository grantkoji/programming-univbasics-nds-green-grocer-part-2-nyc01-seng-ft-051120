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
    end
  end
  cart
end




def apply_clearance(cart)
  cart.map do |cart_info|
    if cart_info[:clearance]
      cart_info[:price] = ((cart_info[:price] * 4) / 5).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  applied_coupons_cart = apply_coupons(consolidated_cart, coupons)
  applied_clearance_cart = apply_clearance(applied_coupons_cart)
  total_Price = 0
  applied_clearance_cart.each do |info|
    total_Price = info[:price] * info[:count]
  end
  if total_Price > 100
    total_Price = (total_Price * 9 / 10).round(2)
  end
  total_Price
end


  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers

