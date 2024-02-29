#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"
echo -e "Welcome to Our Salon, how can I help you?\n"

GET_SERVICES(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # show available services
  SERVICES=$($PSQL "SELECT * FROM services")
  # if there is no service available
  if [[ -z $SERVICES ]]
  then
    echo "Sorry, we don't have any service right now"
  # if there are services, format it and display to user
  else
    echo -e "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  # get customer choice
  read SERVICE_ID_SELECTED
  # if the choice is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
    # send to main menu
      GET_SERVICES "Sorry, that is not a valid choice! Please, choose again."
    else
      VALID_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      # if it is a number but not the valid ones
      if [[ -z $VALID_SERVICE ]]
      then
      # send to main menu
        GET_SERVICES "I could not find that service. What would you like today?"
      else
        # get customer phone number
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        # check if it is a new customer or not
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
          # if it is a new customer
          if [[ -z $CUSTOMER_NAME ]]
          then
            # get the name, phone and include it to the table with the selected service
            echo -e "\nWe don't have a this phone number, what's your name?"
            read CUSTOMER_NAME
            CUSTOMER_INFO_INSERT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
            SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
            # get the time the customer wants to appoint
            echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
            read SERVICE_TIME
            # update the appointment table
            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
            APPOINTMENT_INSERT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
            echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
            # case is an old customer
          else
            # get the service name and ask for the time the customer wants to appoint
            SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
            echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
            read SERVICE_TIME
            # update the appointment table
            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
            APPOINTMENT_INSERT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
            echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
        fi
      fi
    fi
  fi
}

GET_SERVICES
