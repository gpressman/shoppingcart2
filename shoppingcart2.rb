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

	
	


def grapedeal 
		all_grapes = @items.find_all do |item|
			item.itemname=="grapes"
		end
		grapecount=all_grapes.count
	if grapecount>=4 

		freebananas=(grapecount/4).floor
		bananas=Items.new("bananas", 0)
		(1..freebananas).each do |number|
			 @items.push(bananas)
			# add banana to items
		end


	end
	return freebananas
end

def apple_discount 
		all_apples = items.find_all do |item|
		item.itemname=="apples"
	end
		applecount =all_apples.count
		apples = all_apples[0]
		apple_price= apples.itemprice*applecount



	if applecount == 1
		apple_discount= 0
	elsif applecount.even?
		apple_discount= apple_price/2
	else 
		return apple_discount=(apple_price-apples.itemprice)/(2)
	end
end

def orange_discount 

all_oranges = items.find_all do |item|
	item.itemname=="oranges"
end

orangecount =all_oranges.count
oranges = all_oranges[0]

orange_price=oranges.itemprice*orangecount
if orangecount <3
	 orange_discount= 0
elsif orangecount %3==0
	orange_discount=orange_price/3
elsif orangecount %3==1
	orange_discount=(orange_price-oranges.itemprice)/3
else orangecount %3==2
	return orange_discount=((orange_price)-(2*oranges.itemprice))/3
end

end

	def finalprice
		totalprice=0
		@items.each do |product|
		 totalprice=product.itemprice+totalprice
		end

		orange_discount = self.orange_discount
		apple_discount = self.apple_discount

		p "ARE THESE THE DISCounts?", {apples: apple_discount, oranges: orange_discount}
	
		finalprice= totalprice-apple_discount-orange_discount
		return finalprice
	end


end


class Items
	attr_accessor :itemprice, :itemname
	def initialize(name, price )
		@itemname = name
		@itemprice=price
	end

end





apples=Items.new("apples", 10)
oranges=Items.new("oranges", 5)
grapes=Items.new("grapes", 15)
bananas=Items.new("bananas",20)
watermelon=Items.new("watermelon", 50)

items= [apples, oranges, grapes, bananas, watermelon, apples, grapes, grapes, grapes, apples, apples, apples, oranges, oranges, oranges, apples, apples, apples]












# p orange_discount(oranges, orange_price, orangecount)



# p apple_discount(applecount,apple_price, apples)
# p Apples.count	

cart=Cart.new("cart", items)
p cart.finalprice
# p cart.totalprice	


