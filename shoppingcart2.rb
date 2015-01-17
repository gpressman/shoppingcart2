# We are building a shopping cart for our new awesome website. Excepting that we have no website yet everything is in place and ready for our work.

# We need something that calculates the total cost of our purchases but also that applies some discounts to some items.


# cart = ShoppingCart.new

# cart.add :apple
# cart.add :banana

# cart.cost = 30
# Use this table of prices

# apples     10$
# oranges     5$
# grapes     15$
# banana     20$
# watermelon 50$


# Our cart needs to also calculate discount. Remember that we need to be open for future developers to write other discounts.

# At this moment we have this deals:

# Buy 2 apples and pay just one!
# Buy 3 oranges and pay just 2!
# Buy 4 grapes you get one banana for free if you want!


class Cart
	attr_accessor :items
	def initialize (name, items)
		@cartname=name
		@items= items
	end

	def totalprice
		totalprice=0
		@items.each do |product|
		 totalprice=product.itemprice+totalprice
		end
		return totalprice
	end



end


class Items
	attr_accessor :itemprice, :itemname
	def initialize(name, price)
		@itemname = name
		@itemprice=price
	end

	




end


apples=Items.new("apples", 10)
oranges=Items.new("oranges", 5)
grapes=Items.new("grapes", 15)
bananas=Items.new("bananas",20)
watermelon=Items.new("watermelon", 50)

items= [apples, oranges, grapes, bananas, watermelon, apples, apples]

all_apples = items.find_all do |item|
	item.itemname=="apples"
end
applecount =all_apples.count

apple_price= apples.itemprice*applecount

# p apple_price	



def apple_discount applecount, apple_price, apples
	if applecount == 1
		apple_discount= 0
	elsif applecount.even?
		apple_discount= apple_price/2
	else 
		return (apple_price-apples.itemprice)/(2)
	end
end

p apple_discount(applecount,apple_price, apples)



cart=Cart.new("cart", items)
# p cart.totalprice	


