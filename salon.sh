#!/bin/bash
# Script for making salon appointments and record them in database

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

SERVICE_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #get list of services
  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}  

SERVICE_MENU "Welcome to My Salon, how can I help you? (input number for service, type any letter for exit)"
read SERVICE_ID_SELECTED
# looping while non-numerical value is entered
while [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
do
  SERVICE_MENU "I could not find that service. What would you like today?"
  read SERVICE_ID_SELECTED
done

CHECK_SERVICE=$($PSQL "SELECT service_id, name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
# looping while SERVICE_SELECTED does not exist
while [[ -z $CHECK_SERVICE ]]
do
  # back to service menu
  SERVICE_MENU "I could not find that service. What would you like today?"
  read SERVICE_ID_SELECTED
  CHECK_SERVICE=$($PSQL "SELECT service_id, name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
done
  
# ask for phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
# get name of customer
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
# if phone number not in custombers table
if [[ -z $CUSTOMER_NAME ]]
then
  # ask for name
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  # add phone number and name into custombers table
  ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

# get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
# ask for time
echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
read SERVICE_TIME
# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
# update appointments table
APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
# give the output message
echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
