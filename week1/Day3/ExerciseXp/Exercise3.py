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
