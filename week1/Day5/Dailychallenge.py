input_string = input("Enter a list of words separated by commas: ")

word_list = input_string.split(',')

# Sort the list of words alphabetically.
word_list.sort()

sorted_string = ','.join(word_list)

print("The sorted words are:")
print(sorted_string)

def find_longest_word(sentence):
    """Finds and returns the longest word in a sentence."""

    words = sentence.split()

    longest_word = ""

    for word in words:
       if len(word) > len(longest_word):
            longest_word = word
    return longest_word

sentence1 = "Margaret's toy is a pretty doll."
sentence2 = "A thing of beauty is a joy forever."
sentence3 = "Forgetfulness is by all means powerless!"

# Print the results to see the output.
print(f"The longest word in '{sentence1}' is: {find_longest_word(sentence1)}")
print(f"The longest word in '{sentence2}' is: {find_longest_word(sentence2)}")
print(f"The longest word in '{sentence3}' is: {find_longest_word(sentence3)}")