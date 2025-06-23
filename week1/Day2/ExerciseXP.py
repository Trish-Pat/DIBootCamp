# Exercise 1: Favorite Numbers

my_fav_numbers = [4, 8, 2, 10]
print(f"My initial favorite numbers: {my_fav_numbers}")

#Adding 2 numbers to the list
my_fav_numbers.append(20)
my_fav_numbers.append(6)
print(f"After adding two new numbers:{my_fav_numbers}")

friend_fav_numbers = [8, 5, 13, 3]
print(f"My friend's favorite numbers: {friend_fav_numbers}")


# Combine the two lists
all_fav_numbers = my_fav_numbers + friend_fav_numbers
print(f"Combined favorite numbers: {all_fav_numbers}")

# Remove the first number from the combined list
all_fav_numbers.pop(0)
print(f"Combined favorite numbers after removing the first number: {all_fav_numbers}")

# Exercise 2: Tuples
my_tuple = (5, 7, 13,9,1,4,8)
# Trying to add more integers 
my_tuple = my_tuple + (10, 12)
print(f"My tuple after adding more integers: {my_tuple}")

# Exercise 3: Basket List
basket = ["Banana", "Apples", "Oranges", "Blueberries"]
print(f"Basket: {basket}")
basket.remove("Banana")
print(f"Basket after removing Banana: {basket}")
basket.remove("Blueberries")
print(f"Basket after removing Blueberries: {basket}")
basket.append("Kiwi")
print(f"Basket after adding Kiwi: {basket}")

apples_count = basket.count("Apples")
print(f"'Apples' appears {apples_count} time(s) in the basket.")

basket.clear()
print(f"Basket after emptying: {basket}")
print(f"Final state of the basket: {basket}")

# Exercise 4: floats
mixed_numbers = [1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
print(f"Mixed floats and integers list: {mixed_numbers}")

# Exercise 5: loops 
for num in range(1, 21):
    print(num)

# Print numbers from 1 to 20 where the index is 7
for index, num in enumerate(range(1, 21)):
    if index == 7:
        print(f"Index {index}: {num}")

    # Exercise 6 While loop
     #While loop that keeps asking user to enter their name until 'Patriciah' is entered
while True:
    name = input("Please enter your name: ")
    if name.strip().lower() == "patriciah":
        print("Hello, Patriciah!")
        break
    else:
        print("That is not the correct name. Try again.")

# Exercise 7: strings,list,conditionals
favourite_fruits = ["water melons", "apples", "pineapples", "mangoes", "bananas"]
print("My favourite fruits are:")
for fruit in favourite_fruits:
    print(fruit)

# Ask user to enter a fruit
chosen_fruit = input("pineapples: ").strip().lower()
# Check if the fruit is in the list (case-insensitive)
if chosen_fruit in [fruit.lower() for fruit in favourite_fruits]:
    print("You chose one of your favorite fruits! Enjoy!")
else:
    print("You chose a new fruit. I hope you enjoy it!")

# Exercise 8: Pizza Toppings
pizza_toppings = []
while True:
    topping = input("Enter a pizza topping (or type 'quit' to finish): ").strip()
    if topping.lower() == 'quit':
        break
    pizza_toppings.append(topping)
    print(f"Adding {topping} to your pizza.")

print("\nYour pizza toppings:")
for topping in pizza_toppings:
    print(f"- {topping}")

total_cost = 10 + 2.5 * len(pizza_toppings)
print(f"Total cost of the pizza: ${total_cost:.2f}")

# Exercise 9: Movie Ticket Cost
family_ages = []
while True:
    age_input = input("Enter the age of a family member (or type 'done' to finish): ").strip()
    if age_input.lower() == 'done':
        break
    if age_input.isdigit():
        family_ages.append(int(age_input))
    else:
        print("Please enter a valid age or 'done'.")

total_cost = 0
for age in family_ages:
    if age < 3:
        total_cost += 0
    elif 3 <= age <= 12:
        total_cost += 10
    else:
        total_cost += 15
print(f"Total ticket cost for the family: ${total_cost}")

# Example family ages for demonstration
example_family_ages = [2, 5, 9, 14, 35]
print(f"Example family ages: {example_family_ages}")
example_total_cost = 0
for age in example_family_ages:
    if age < 3:
        example_total_cost += 0
    elif 3 <= age <= 12:
        example_total_cost += 10
    else:
        example_total_cost += 15
print(f"Total ticket cost for the example family: ${example_total_cost}")














