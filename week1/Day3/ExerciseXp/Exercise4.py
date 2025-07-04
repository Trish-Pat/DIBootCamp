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

