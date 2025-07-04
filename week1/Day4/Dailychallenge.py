MATRIX_STR = """
7ii
Tsx
h%?
i #
sM
$a
#t%"""

rows = MATRIX_STR.strip().split('\n')

# Read the matrix column by column to create one long string.
column_wise_string = ""
num_columns = len(rows[0]) # Get the number of columns from the first row.
num_rows = len(rows)

# Loop through each column index first, then each row index.
for col in range(num_columns):
    for row in range(num_rows):
        # Add the character from that position to our string.
        # Add a check to ensure the row has enough characters
        if col < len(rows[row]):
            column_wise_string += rows[row][col]

decoded_message = ""
# This flag helps us know if we should add a space.
last_char_was_alpha = False

for char in column_wise_string:
    if char.isalpha():
        decoded_message += char
        last_char_was_alpha = True
    elif last_char_was_alpha:
        decoded_message += " "
        last_char_was_alpha = False

print(decoded_message.strip())