require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    if item_is_in_basket && item_with_coupon[:count] >= coupon[:num]
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
    if cart_info[:clearance] == true
      cart_info[:price] = ((cart_info[:price] * 4) / 5).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  final_cart = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))

  total = 0

  final_cart.each do |item|
    total += item[:price] * item[:count]
  end

  total *= 0.9 if total > 100

  total.round(2)
end
