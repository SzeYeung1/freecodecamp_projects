#!/bin/bash
# Script of number guessing game which save users' information
# Define PSQL variable
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# Welcome message
echo -e "\n~~~~~Number Guessing Game~~~~~\n"
# Enter username
echo -e "\nEnter your username:"
read USERNAME
# Get user id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# If username not in users table
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  # Insert into users table
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # Get newly created user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # Else print out user's information
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM gamelogs WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM gamelogs WHERE user_id=$USER_ID")
  echo -e "\nWelcome back, $USERNAME! You have played $(echo $GAMES_PLAYED | sed -r 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -r 's/^ *| *$//g') guesses.\n"
fi

# Guessing game
# Generate secret number 1-1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
# Set counter and get initial guess
NUMBER_OF_GUESSES=1
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

# Looping if input is not interger
until [[ $GUESS =~ ^[0-9]+$ ]]
do
  echo -e "That is not an integer, guess again:"
  read GUESS
done

# Looping until guessed right
until [[ $GUESS -eq $SECRET_NUMBER ]]
do  
  # if higher
  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo -e "It's lower than that, guess again:"
  else
  # if lower
    echo -e "It's higher than that, guess again:"
  fi
  
  (( NUMBER_OF_GUESSES++ ))
  read GUESS
  # check interger
  until [[ $GUESS =~ ^[0-9]+$ ]]
  do
    echo -e "That is not an integer, guess again:"
  read GUESS
  done
done

# Have correct guess and break the loops
# Winning message
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!\n"

# Update gamelogs table
UPDATE_GAMELOGS=$($PSQL "INSERT INTO gamelogs(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")


