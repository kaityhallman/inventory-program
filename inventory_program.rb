# Create new hash
inventory = Hash.new

# Inventory of fridge
inventory["almond milk"] = "1 carton"
inventory["strawberries"] = "1 pint"
inventory["goat cheese"] = "4 ounces"
inventory["chicken breast"] = "1 pound"
inventory["lettuce"] = "1 head"





############# METHODS

#Print
def print_inventory(hash)
	hash.each {|key, value| puts "There is #{value} of #{key} in the fridge."}
end

#Add
def add_item(hash, key, value)
	hash[key] = value
	hash.store(key, value)
	puts "You have added #{value} #{key} to your fridge."
end

#Edit
def edit_item(hash, key, value)
	hash[key] = value
    puts "You now have #{value} #{key}."
end

#Rename
def rename_item(hash, key, new_key, amount)
	hash[new_key] = hash.delete(key)
	hash[new_key] = amount
	puts "You have renamed #{key} as #{amount} of #{new_key}."
end
	
#Delete
def delete_item(hash, key)
	hash.delete(key)
	puts "You have removed #{key} from your fridge."
end


# Method for choices
def welcome
puts "Please select what you would like to do:"
puts "1. Check out what's in the fridge"
puts "2. Add something to the fridge"
puts "3. Edit the amount of something in the fridge"
puts "4. Replace an item with another"
puts "5. Remove something from the fridge"
puts "Exit to close the fridge"
end








############ CODE FLOW


puts "Welcome to your refrigerator."

welcome
choice = gets.chomp	


# Case depending on user input
while true

case choice
	when "1"
		# Print inventory, prompt user for new choice.
		print_inventory(inventory)
		welcome
		choice = gets.chomp

	when "2"
		# Add new item and value, print inventory, and prompt user for new choice.
		puts "What would you like to add?"
		food = gets.chomp
		puts "How much?"
		amount = gets.chomp
		add_item(inventory, food, amount)
		print_inventory(inventory)
		welcome 
		choice = gets.chomp

	when "3"
		# Edit value, print inventory, and prompt user for new choice.
		puts "Which item would you like to edit?"
		item = gets.chomp

		if inventory.has_key?(item)
			amount = inventory[item]
			puts "There are #{amount} #{item}. How many do you want to change this to?"
			amount = gets.chomp
			edit_item(inventory, item, amount)
			print_inventory(inventory)
		end
		welcome 
		choice = gets.chomp



	when "4"
		# Rename item with new value, print inventory, and prompt user for new choice
		puts "Which item would you like to rename?"
		item = gets.chomp


		if inventory.has_key?(item)
			puts "What would you like to replace it with?"
			new_item = gets.chomp

			puts "How much of this item?"
			amount = gets.chomp
			rename_item(inventory, item, new_item, amount)
			print_inventory(inventory)

		end

		welcome 
		choice = gets.chomp




	when "5"
		# Replace new item, print inventory, and prompt user for new choice
		puts "Which item would you like to remove?"
		item = gets.chomp

		if inventory.has_key?(item)
			delete_item(inventory, item)
			print_inventory(inventory)
		end

		welcome 
		choice = gets.chomp



	# Escape
	when "Exit", "exit"
		break

	end
end


