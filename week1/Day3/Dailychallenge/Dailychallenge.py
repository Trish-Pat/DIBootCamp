# 1. Ask the user to enter a word.
user_word = input("Please enter a word: ")

# 2. Create an empty dictionary to store the results.
letter_indices = {}

# 3. Loop through the word to get each letter and its index.
for index, letter in enumerate(user_word):
    if letter in letter_indices:
        letter_indices[letter].append(index)
    else:
        letter_indices[letter] = [index]
# Print the final dictionary.
print("challenge 1")
print(f"The letter indices for '{user_word}' are:")
print(letter_indices,'\n')

# Provided data
items_purchase = {
  "Water": "$1",
  "Bread": "$3",
  "TV": "$1,000",
  "Fertilizer": "$20"
}
wallet = "$300"


wallet_amount = int(wallet.replace('$', '').replace(',', ''))

affordable_items = []

for item_name, item_price_str in items_purchase.items():
    item_price = int(item_price_str.replace('$', '').replace(',', ''))

    if item_price <= wallet_amount:
        affordable_items.append(item_name)

if not affordable_items:
    print("Nothing")
else:
    print('\nchallenge 2')
    print(sorted(affordable_items))