
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ ! $1 =~ ^[0-9]+$ ]] # si el input no es un numero entra
  then
    if [[ $1 =~ ^[A-Z][a-z]?$ ]] #si el input es una cadena de caracteres de 2 digitos que empieza con mayuscula entra
    then
      ELEMENT_AN=$($PSQL"SELECT atomic_number FROM elements WHERE symbol='$1'")
      if [[ -z $ELEMENT_AN ]] # si es que la cadena de 2 digitos (simbolo) no existe en la base de datos
      then
        echo "I could not find that element in the database."
      else # si la cadena de 2 digitos (simbolo) existe en la base de datos
        ELEMENT_NAME=$($PSQL"SELECT name FROM elements WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_SYMBOL=$($PSQL"SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_TYPE=$($PSQL"SELECT type FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_MASS=$($PSQL"SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_MP=$($PSQL"SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_BP=$($PSQL"SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')
        ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')
        ELEMENT_TYPE_FORMATTED=$(echo $ELEMENT_TYPE | sed 's/ |/"/')
        ELEMENT_MASS_FORMATTED=$(echo $ELEMENT_MASS | sed 's/ |/"/')
        ELEMENT_MP_FORMATTED=$(echo $ELEMENT_MP | sed 's/ |/"/')
        ELEMENT_BP_FORMATTED=$(echo $ELEMENT_BP | sed 's/ |/"/')
      echo "The element with atomic number $ELEMENT_AN is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $ELEMENT_TYPE_FORMATTED, with a mass of $ELEMENT_MASS_FORMATTED amu. $ELEMENT_NAME_FORMATTED has a melting point of $ELEMENT_MP_FORMATTED celsius and a boiling point of $ELEMENT_BP_FORMATTED celsius."
      fi
    else # si es que el input es una cadena de caracteres de cualquier longitud
      ELEMENT_AN=$($PSQL"SELECT atomic_number FROM elements WHERE name='$1'")
      if [[ -z $ELEMENT_AN ]]
      then
        echo "I could not find that element in the database."
      else
        ELEMENT_NAME=$($PSQL"SELECT name FROM elements WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_SYMBOL=$($PSQL"SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_TYPE=$($PSQL"SELECT type FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_MASS=$($PSQL"SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_MP=$($PSQL"SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_BP=$($PSQL"SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_AN")
        ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')
        ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')
        ELEMENT_TYPE_FORMATTED=$(echo $ELEMENT_TYPE | sed 's/ |/"/')
        ELEMENT_MASS_FORMATTED=$(echo $ELEMENT_MASS | sed 's/ |/"/')
        ELEMENT_MP_FORMATTED=$(echo $ELEMENT_MP | sed 's/ |/"/')
        ELEMENT_BP_FORMATTED=$(echo $ELEMENT_BP | sed 's/ |/"/')
      echo "The element with atomic number $ELEMENT_AN is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $ELEMENT_TYPE_FORMATTED, with a mass of $ELEMENT_MASS_FORMATTED amu. $ELEMENT_NAME_FORMATTED has a melting point of $ELEMENT_MP_FORMATTED celsius and a boiling point of $ELEMENT_BP_FORMATTED celsius."
      
      fi
    fi
  else # si el input ingresado es un numero
    ELEMENT_AN=$($PSQL"SELECT atomic_number FROM elements WHERE atomic_number=$1")
    if [[ -z $ELEMENT_AN ]] # si es que el numero no existe en la base de datos
    then
      echo "I could not find that element in the database."
    else # si es que el numero existe en la base de datos
      ELEMENT_NAME=$($PSQL"SELECT name FROM elements WHERE atomic_number=$ELEMENT_AN")
      ELEMENT_SYMBOL=$($PSQL"SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_AN")
      ELEMENT_TYPE=$($PSQL"SELECT type FROM properties WHERE atomic_number=$ELEMENT_AN")
      ELEMENT_MASS=$($PSQL"SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_AN")
      ELEMENT_MP=$($PSQL"SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_AN")
      ELEMENT_BP=$($PSQL"SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_AN")
      ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')
      ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')
      ELEMENT_TYPE_FORMATTED=$(echo $ELEMENT_TYPE | sed 's/ |/"/')
      ELEMENT_MASS_FORMATTED=$(echo $ELEMENT_MASS | sed 's/ |/"/')
      ELEMENT_MP_FORMATTED=$(echo $ELEMENT_MP | sed 's/ |/"/')
      ELEMENT_BP_FORMATTED=$(echo $ELEMENT_BP | sed 's/ |/"/')
      echo "The element with atomic number $ELEMENT_AN is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $ELEMENT_TYPE_FORMATTED, with a mass of $ELEMENT_MASS_FORMATTED amu. $ELEMENT_NAME_FORMATTED has a melting point of $ELEMENT_MP_FORMATTED celsius and a boiling point of $ELEMENT_BP_FORMATTED celsius."
    fi
  fi
fi
