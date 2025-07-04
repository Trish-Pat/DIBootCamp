# Define a function to print a message.
def display_message():
    """This function prints a sentence about learning Python functions."""
    print("I am learning about functions in Python.")

# Call the function to display the message.
display_message()

# Define a function that accepts one parameter (the book's title).
def favorite_book(title):
    """This function prints a message about a favorite book."""
    print(f"One of my favorite books is {title}.")

# Call the function with a specific book title.
favorite_book("Alice in Wonderland")

# Define a function with a default parameter for the country.
def describe_city(city, country="Iceland"):
    """This function prints a sentence describing a city and its country."""
    print(f"{city} is in {country}.")

# Call the function for a city in Iceland (default country).
describe_city("Reykjavik")

# Call the function for a city in a different country.
describe_city("Paris", "France")

import random

def compare_to_random(user_number):
    """Compares a given number (1-100) to a randomly generated one."""

    # Generate a random integer between 1 and 100.
    random_number = random.randint(1, 100)

    print(f"Your number: {user_number}, Random number: {random_number}")

    # Check if the numbers match.
    if user_number == random_number:
        print("Success! The numbers are the same.")
    else:
        print("Fail! The numbers are different.")

# Call the function with a number.
compare_to_random(50)
def make_shirt(size="large", text="I love Python"):
    """Prints a summary of the shirt's size and message."""
    print(f"The size of the shirt is {size} and the text is '{text}'.")

make_shirt()

make_shirt("medium")

make_shirt("small", "Python is fun!")

make_shirt(text="Hello World!", size="extra large")

# Create a list of magician names.
magician_names = ['Harry Houdini', 'David Blaine', 'Criss Angel']

# Define a function to print each magician's name.
def show_magicians(names_list):
    """Prints each name from a list of magicians."""
    for name in names_list:
        print(name)


# Define a function to add " the Great" to each name.
def make_great(names_list):
    """Modifies a list of names by adding ' the Great' to each."""
    # Loop through the list by index to modify each element.
    for i in range(len(names_list)):
        names_list[i] = names_list[i] + " the Great"
    return names_list

# Modify the list to add " the Great".
great_magicians = make_great(magician_names)

# Call the show_magicians function to display the modified names.
show_magicians(great_magicians)


import random

def get_random_temp():
    """Returns a random integer between -10 and 40."""
    return random.randint(-10, 40)

def main():
    """Gets a random temperature and gives advice based on it."""

    temperature = get_random_temp()
    print(f"The temperature right now is {temperature} degrees Celsius.")

    if temperature < 0:
        print("Brrr, that’s freezing! Wear some extra layers today.")
    elif 0 <= temperature < 16:
        print("Quite chilly! Don’t forget your coat.")
    elif 16 <= temperature < 24:
        print("Nice weather today.")
    elif 24 <= temperature < 32:
        print("A bit warm, stay hydrated.")
    else:
        print("It’s really hot! Stay cool.")

main()

def get_random_temp_seasonal(season):
    """Returns a random temperature based on the season."""
    if season == "winter":
        return random.randint(-10, 10)
    elif season == "spring":
        return random.randint(5, 20)
    elif season == "summer":
        return random.randint(20, 40)
    elif season == "autumn":
        return random.randint(0, 15)

print("\n--- Bonus: Seasonal Temperature ---")
current_season = "summer"
seasonal_temp = get_random_temp_seasonal(current_season)
print(f"The seasonal temperature for {current_season} is {seasonal_temp} degrees Celsius.")





