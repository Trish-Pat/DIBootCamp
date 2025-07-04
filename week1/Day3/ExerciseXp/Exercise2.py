family = {"rick": 43, 'beth': 13, 'morty': 5, 'summer': 8}

# We start at 0 and will add the cost of each ticket to it.
total_cost = 0

for name, age in family.items():
    # Check the age to determine the ticket price based on the rules.

    # If the person is younger than 3, the ticket is free.
    if age < 3:
        ticket_price = 0
        print(f"{name.capitalize()}'s ticket is free.")

    # If the person is between 3 and 12 (inclusive), the ticket is $10.
    elif 3 <= age <= 12:
        ticket_price = 10
        print(f"{name.capitalize()}'s ticket costs $10.")

    # For anyone older than 12, the ticket is $15.
    else:
        ticket_price = 15
        print(f"{name.capitalize()}'s ticket costs $15.")

    # Add the price of the current person's ticket to the total cost.
    total_cost += ticket_price

# After the loop has finished, print the final total cost for the whole family.
print("\n--- Total Cost ---")
print(f"The total cost for the family is: ${total_cost}")