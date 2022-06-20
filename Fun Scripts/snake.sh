#!/usr/bin/env bash 
#------------------------------------------------------------------
# Description: A fun game, snake game to you have a nostalgic time
# Version: 0.1.0
# Script Name: snake.sh
# Copright: https://github.com/flxwu/snake-bash/blob/master/snake.sh
#------------------------------------------------------------------

# Colors 
# red, green, cyan

# Functions 
function apple() {
 # coordinates of the apple within the game area
 APPLEX=$[( $RANDOM % ( $[ $AREAMAXX - $AREAMINX ] + 1 ) ) + $AREAMINX ]
 APPLEY=$[( $RANDOM % ( $[ $AREAMAXY - $AREAMINY ] + 1) ) + $AREAMINY ]
}

drawnapple() {
  LAST=$(( ${#LASTPOSX[@]} - 1 ))
  x=0 
  apple
  while [ "$x" -le "$LAST" ];
  do 
    if [ "$APPLEX" = "${LASTPOSX[$x]}" ] && [ "$APPLEY" = "${LASTPOSY[$x]}" ];
    then
      x=0 
      apple 
    else 
      x=$(( $x + 1 ))
    fi 
  done
  tput setf 4 #number color 
  tput cup $APPLEY $APPLEX 
  printf %b "$APPLECHAR"
  tput setf 9
}

snakegrow() {
  LASTPOSX=( ${LASPOSX[0]} ${LASPOSX[0]} ${LASTPOSX[0]} ${LASTPOSX[@]} )
  LASTPOSY=( ${LASTPOSY[0]} ${LASTPOSY[0]} ${LASTPOSY[0]} ${LASTPOSY[@]} )
  RET=1 
  while [[ "$RET" -eq "1" ]]; 
  do
    apple 
    RET=$?
  done
  drawnapple 
}

move() {
  case "$DIRECTION" in 
    u) POSY=$(( $POSY - 1 ));;
    d) POSY=$(( $POSY + 1 ));;
    l) POSX=$(( $POSX - 1 ));;
    r) POSX=$(( $POSY + 1 ));;
  esac 

  # Collision
  ( sleep $DELAY && kill $ALRM $$ ) &
  if [ "$POSX" -le "$FIRSTCOL" ] || [ "$POSX" -ge "$LASTCOL" ]; then
    tput cup $(( $LASTROW + 1 )) 0 
    stty echo 
    echo "GAME OVER" 
    gameover
  elif [ "$POSY" -le "$FIRSTROW" ] || [ "$POSY" -ge "$LASTROW" ]; then 
    tput cup $(( $LASTROW +1 )) 0 
    stty echo 
    echo "GAME OVER"
    gameover 
  fi 

  #Get last element of array
  LAST=$(( ${#LASTPOSX[@]} - 1 ))
  x=1 # start element 1 as to position 0
  while [ "$x" -le "$LAST" ];
  do 
    if [ "$POSX" = "${LASTPOSX[$x]}" ] && [ "$POSY" = "${LASTPOSY[$x]}" ];
    then 
      tput cup $(( $LASTROW + 1 )) 0 
      echo "GAME OVER you eat yourself?????" 
      gameover 
    fi 
    x=$(( $x + 1 ))
  done 

  #clear position on screen 
  tput cup ${LASTPOSY[0]} ${LASTPOSX[0]}
  printf " "

  # get rid of oldest position history
  LASTPOSX=( `echo "${LASTPOSX[@]}" | cut -d " " -f 2-` $POSX )
  LASTPOSY=( `echo "${LASTPOSY[@]}" | cut -d " " -f 2-` $POSY )
  tput cup 1 10 
  tput cup 2 10 
  echo "SIZE=${#LASTPOSX[@]}"

  # update position history
  LASTPOSX[$LAST]=$POSX
  LASTPOSY[$LAST]=$POSY

  # make new position 
  tput setf 2 #set color
  tput cup $POSY $POSX
  printf %b "$SNAKECHAR"
  tput setf 9

  # check if we hit the apple 
  if [ "$POSX" -eq "$APPLEX" ] && [ "$POSY" -eq "$APPLEY" ]; then 
    snakegrow
    updatescore 10
  fi 
}

function updatescore(){
  SCORE=$(( $SCORE + $1 ))
  tput cup 2 30 
  printf "SCORE: $SCORE"
}

function randomchar() {
  [ $# -eq 0 ] && return 1 
  n=$(( ($RANDOM % $#) + 1 ))
  eval DIRECTION=\${$n}
}

function gameover() {
  tput cvvis
  stty echo
  sleep $DELAY
  trap exit ALRM
  tput cup $ROWS 0 
  exit
}

border () {
 tput setf 6
 tput cup $FIRSTROW $FIRSTCOL
 x=$FIRSTCOL
 while [ "$x" -le "$LASTCOL" ];
 do 
   printf %b "$WALL"
   x=$(( $x + 1 ));
 done 
 #Sides
 x=$FIRSTROW
 while [ "$x" -le "$LASTROW" ];
 do 
   tput cup $x $FIRSTCOL; printf %b "$WALL"
   tput cup $x $LASTCOL; printf %b "$WALL"
   x=$(( $x + 1 ));
 done
 #Bottom 
 tput cup $LASTROW $FIRSTCOL
 x=$FIRSTCOL
 while [ "$x" -le "$LASTCOL" ];
 do 
   printf %b "$WALL"
   x=$(( $x + 1 ));
 done
 tput setf 9
}

SNAKECHAR="@"
WALL="X"
APPLECHAR="o"

SNAKESIZE=3 
DELAY=0.2 
FIRSTROW=3 
FIRSTCOL=1 
LASTCOL=40 
LASTROW=20 
AREAMAXX=$(( $LASTCOL - 1 ))
AREAMINX=$(( $FIRSTCOL + 1 ))
AREAMAXY=$(( $LASTROW -1 ))
AREAMINY=$(( $FIRSTROW + 1))
ROWS=`tput lines`
ORIGINX=$(( $LASTCOL / 2 ))
ORIGINY=$(( $LASTROW / 2 ))
POSX=$ORIGINX
POSY=$ORIGINY
#Pads 
ZEROES=`echo |awk '{printf("%0"'"$SNAKESIZE"'"d\n",$1)}' | sed 's/0/0 /g'`
LASTPOSX=( $ZEROES )
LASTPOSY=( $ZEROES )

SCORE=0 

clear 

echo "
Keys:
 W - Up 
 S - Down 
 A - Left 
 D - Right
 Q - Quit

 Press Return to continue...
"

stty -echo 
tput civis 
read RTN
tput setb 0 
tput bold 
clear
border 
updatescore 0 

drawnapple
sleep 1 
trap move ALRM

DIRECTIONS=( up down left right )
randomchar "${DIRECTIONS[@]}"

sleep 1 
move 
while :
do 
  read -s -n 1 key 
  case "$key" in 
  w) DIRECTION="u";;
  s) DIRECTION="d";;
  d) DIRECTION="l";;
  a) DIRECTION="r";;
  q) tput cup $COLS 0 
    echo "Quitting..."
    tput cvvis
    stty echo 
    tput reset
    printf "I will waiting for you!\n"
    trap exit ALRM
    sleep $DELAY
    exit 0 
    ;;
  esac
done
