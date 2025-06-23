# 1. Ask for User Input:
user_input = input("Enter a sentence: ")
print(user_input)

# # The string must be exactly 10 characters long.
# # 2. Check the Length of the String:
length_input = len(user_input)
print(length_input)

# If the string is less than 10 characters, print: "String not long enough."
# If the string is more than 10 characters, print: "String too long."
# If the string is exactly 10 characters, print: "Perfect string" and proceed to the next steps.
# 3. Print the First and Last Characters:
if length_input < 10:
    print("String not long enough.")
elif length_input == 10:
    print("Perfect string and proceed to the next steps.")
else:
    print("String too long.")

# Once the string is validated, print the first and last characters.
print(user_input[0:1], user_input[-1:])

# 4. Build the String Character by Character:

# string_loop = [1, 23, 45, "Car"] - List
# eye = (1, 23, 45, "Car") - Tuple
# chairs = {"name": "Paul", "age": 45} 
# ("name" - Key, "Paul" - Value), ("age" - Key, 45 - Value)
# print("My name is ", chairs["name"], " and I am ", chairs["age"], " old." )

# Using a for loop, construct and print the string character by character. Start with the first character, then the first two characters, and so on, until the entire string is printed.
# Hint: You can create a loop that goes through the string, adding one character at a time, and print it progressively.
output = ""
for character in user_input:
    output += character
    print(output)

# 5. Bonus: Jumble the String (Optional)

# As a bonus, try shuffling the characters in the string and print the newly jumbled string.
# Hint: You can use the random.shuffle function to shuffle a list of characters.
import random
shuffled_sentence = list(user_input)
random.shuffle(shuffled_sentence)
final_sentence = "".join(shuffled_sentence)
print(final_sentence)


