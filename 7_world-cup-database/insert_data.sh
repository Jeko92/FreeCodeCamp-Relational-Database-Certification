#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")
echo $($PSQL "SELECT setval('teams_team_id_seq', 1);")
echo $($PSQL "SELECT setval('games_game_id_seq', 1);")

# add teams to teams table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Exclude first row
  if [[ $YEAR != "year" && $ROUND != "Round" && $WINNER != "Winner" && $OPPONENT != "Opponent" && $WINNER_GOALS != "winner_goals" && $OPPONENT_GOALS != "opponent_goals" ]]
  then
    # insert unique teams into teams table
    # check if the winner team already exists in DB
    WINNER_TEAM="$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")"
    # if winner team is not into table
    if [[ -z $WINNER_TEAM ]]
    then
      # insert winner into table
      INSERT_WINNER="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
      # if successfully inserted print success message
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
      then
        echo Inserted $WINNER successfully!
      else
        echo failed to insert $WINNER
      fi
    else
      echo $WINNER already exists in table
    fi

    # check if the opponent team already exists in DB
    OPPONENT_TEAM="$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")"
    # if opponent team is not into table
    if [[ -z $OPPONENT_TEAM ]]
    then
      # insert opponent into table
      INSERT_OPPONENT="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
      # if insertion is sucessful, print a success message
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
      then
        echo Inserted $OPPONENT successfully!
      else
        echo Failed to insert $OPPONENT!
      fi
    else
      echo $OPPONENT already exists
    fi

    # get team id of the game participant teams
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # insert game data into games table
    INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo Game data inserted Successfully!
    else
      echo Failed to insert game data!
    fi
  fi
done