board = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
]
board

def display_board(board):
    """Prints the current Tic Tac Toe board in a readable format."""
    print(" --- --- ---")
    for row in board:
        # Print each row with separators.
        print(f"| {row[0]} | {row[1]} | {row[2]} |")
        print(" --- --- ---")

        # A function to get and validate player input.
def player_input(player, board):
    """Asks the current player for their move and validates it."""
    while True: # Loop until the player provides a valid move.
        # Ask the player for a row and column (from 1 to 3).
        print(f"Player {player}, enter your move.")
        try:
            row = int(input("Enter row (1-3): ")) - 1 # Subtract 1 to get list index (0-2).
            col = int(input("Enter column (1-3): ")) - 1 # Subtract 1 to get list index (0-2).
        except ValueError:
            print("Invalid input. Please enter a number.")
            continue

        # Check if the chosen row and column are within the 0-2 range.
        if 0 <= row <= 2 and 0 <= col <= 2:
            # Check if the chosen cell is empty.
            if board[row][col] == ' ':
               return row, col # Return the valid move.
            else:
                print("This spot is already taken! Try again.")
        else:
            print("Invalid input. Row and column must be between 1 and 3.")
# A function to get and validate player input.
def player_input(player, board):
    """Asks the current player for their move and validates it."""
    while True: # Loop until the player provides a valid move.
        # Ask the player for a row and column (from 1 to 3).
        print(f"Player {player}, enter your move.")
        row = int(input("Enter row (1-3): ")) - 1 # Subtract 1 to get list index (0-2).
        col = int(input("Enter column (1-3): ")) - 1 # Subtract 1 to get list index (0-2).

        # Check if the chosen row and column are within the 0-2 range.
        if 0 <= row <= 2 and 0 <= col <= 2:
            # Check if the chosen cell is empty.
            if board[row][col] == ' ':
               return row, col # Return the valid move.
            else:
                print("This spot is already taken! Try again.")
        else:
            print("Invalid input. Row and column must be between 1 and 3.")
# A function to check if a player has won.
def check_win(board, player):
    """Checks if the given player has won the game."""
    # Check all three rows for a win.
    for row in board:
        if all(cell == player for cell in row):
            return True

    # Check all three columns for a win.
    for col in range(3):
        if all(board[row][col] == player for row in range(3)):
            return True

    # Check the two diagonals for a win.
    if all(board[i][i] == player for i in range(3)):
        return True
    if all(board[i][2 - i] == player for i in range(3)):
        return True

    # If no winning condition is met, return False.
    return False
# A function to check if the game is a tie.
def check_tie(board):
    """Checks if the board is full, resulting in a tie."""
    # Loop through every cell on the board.
    for row in board:
        for cell in row:
            # If any cell is empty, the game is not a tie yet.
            if cell == ' ':
                return False
    # If the loop finishes without finding an empty cell, it's a tie.
    return True
# A function to check if the game is a tie.
def check_tie(board):
    """Checks if the board is full, resulting in a tie."""
    # Loop through every cell on the board.
    for row in board:
        for cell in row:
            # If any cell is empty, the game is not a tie yet.
            if cell == ' ':
                return False
    # If the loop finishes without finding an empty cell, it's a tie.
    return True

# The main function to control the game flow.
def play_game():
    """Manages the main game loop and player turns."""
    current_player = 'X' # Player 'X' always starts.

    # The main game loop continues as long as the game is not over.
    while True:
        # Display the current state of the board.
        display_board(board)

        # Get the current player's move.
        row, col = player_input(current_player, board)

        # Update the board with the player's move.
        board[row][col] = current_player

        # Check if the current player has won.
        if check_win(board, current_player):
            display_board(board) # Show the final winning board.
            print(f"Congratulations! Player {current_player} wins!")
            break

        # Check if the game is a tie.
        if check_tie(board):
            display_board(board) # Show the final tied board.
            print("It's a tie!")
            break # Exit the loop.

        # Switch to the other player for the next turn.
        if current_player == 'X':
            current_player = 'O'
        else:
            current_player = 'X'

# Start the game by calling the main function.
play_game()

