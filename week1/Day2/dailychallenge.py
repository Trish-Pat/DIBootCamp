#mutiples of a number

# Get two inputs: a number (integer) and a length (integer)
number = int(input("Enter a number: "))
length = int(input("Enter the length: "))

# number = 3, length = 5, but stop at 10
# number = 3
# length = 5
multiples = []
for i in range(1, length + 1):
    product = number * i
    multiples.append(product)

   
   
print(f"Multiples of {number} up to length of  {length}: {multiples}")


#challenge 2

user_string = input("Enter a string to remove duplicates: ")

def remove_duplicates(s):
    seen = set()
    result = []
    for char in s:
        if char not in seen:
            seen.add(char)
            result.append(char)
    return ''.join(result)

result_string = remove_duplicates(user_string)
print(f"String after removing duplicates: {result_string}")

    

