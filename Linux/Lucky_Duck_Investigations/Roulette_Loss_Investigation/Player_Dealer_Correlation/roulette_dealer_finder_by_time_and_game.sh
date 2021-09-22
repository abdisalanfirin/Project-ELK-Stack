#!/bin/bash
cat $1_Dealer_schedule | awk -F " " '{print "Black Jack dealer: " $3, $4, "| Roulette dealer: " $5, $6, "| Texas Hold EM dealer: " $7, $8, "were all working during the " $1, $2, "shift."}' | grep "$2" 

