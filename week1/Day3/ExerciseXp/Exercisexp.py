# 1. Here are the two lists provided in the exercise.
keys = ['Ten', 'Twenty', 'Thirty']
values = [10, 20, 30]

# 2. This is where we will put our key-value pairs.
result_dict = {}
result_dict = dict(zip(keys, values))

# 3. Print the final dictionary to see the output.
print("--- Exercise 1: Result ---")
print(result_dict)

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

# 1. Create a dictionary called brand with the provided data.
brand = {
    "name": "Zara",
    "creation_date": 1975,
    "creator_name": "Amancio Ortega Gaona",
    "type_of_clothes": ["men", "women", "children", "home"],
    "international_competitors": ["Gap", "H&M", "Benetton"],
    "number_stores": 7000,
    "major_color": {
        "France": "blue",
        "Spain": "red",
        "US": ["pink", "green"]
    }
}

# 2. Change the value of number_stores to 2.
brand["number_stores"] = 2
print(f"Zara's number of stores has been changed to: {brand['number_stores']}")

# 3. Print a sentence describing Zara’s clients.
#    We access the list of clothes types and join them into a readable string.
client_types = ", ".join(brand["type_of_clothes"])
print(f"Zara's clients include: {client_types}.")

# 4. Add a new key country_creation with the value Spain.
brand["country_creation"] = "Spain"
print(f"Added country of creation: {brand['country_creation']}")

# 5. Check if international_competitors exists and add “Desigual”.
if "international_competitors" in brand:
    brand["international_competitors"].append("Desigual")
print(f"Updated competitors: {brand['international_competitors']}")

# 6. Delete the creation_date key.
del brand["creation_date"]
print("The 'creation_date' key has been deleted.")

# 7. Print the last item in international_competitors.
last_competitor = brand["international_competitors"][-1]
print(f"The last international competitor is: {last_competitor}")

# 8. Print the major colors in the US.
us_colors = brand["major_color"]["US"]
print(f"The major colors in the US are: {us_colors}")

# 9. Print the number of keys in the dictionary.
num_keys = len(brand)
print(f"The dictionary has {num_keys} keys.")

# 10. Print all keys of the dictionary.
print(f"The keys of the dictionary are: {list(brand.keys())}")

# 11. Print the dictionary to see all changes
print("\nFinal brand dictionary:")
print(brand)


# The list of Disney characters to work with.
users = ["Mickey", "Minnie", "Donald", "Ariel", "Pluto"]
print(f"Original list of users: {users}\n")

dict1_name_to_index = {}
for index, name in enumerate(users):
    dict1_name_to_index[name] = index

print("--- Result 1: Characters mapped to Index ---")
print(dict1_name_to_index)

# Expected: {0: "Mickey", 1: "Minnie", 2: "Donald", 3: "Ariel", 4: "Pluto"}

dict2_index_to_name = {}
for index, name in enumerate(users):
    dict2_index_to_name[index] = name

print("\n--- Result 2: Index mapped to Characters ---")
print(dict2_index_to_name)

# Expected: {"Ariel": 0, "Donald": 1, "Mickey": 2, "Minnie": 3, "Pluto": 4}

dict3_sorted_names = {}

sorted_users = sorted(users)
print(f"\nSorted list of users: {sorted_users}")

for index, name in enumerate(sorted_users):
    dict3_sorted_names[name] = index

print("\n--- Result 3: Sorted Characters mapped to Index ---")
print(dict3_sorted_names)

