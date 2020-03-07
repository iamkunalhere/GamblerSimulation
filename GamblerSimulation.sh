#!/bin/bash -x

#Problem Statement : Gambler Simulation
#Discription : This problem simulates a Gambler. Being a Calculative Gambler exits if the Stake reaches a high or a low limit.
#Author : Kunal Jadhav
#Date : 7 March 2020

function winOrLoose() {
	state=$((RANDOM%2))
	if  [[ $state -eq 1 ]]
	 then
		dayStakes=$(($dayStakes+1))
	 else
		dayStakes=$(($dayStakes-1))
	fi
}

dayStakes=100
bet=1
totalStakes=0
days=1

while [[ $days -lt 21 ]]
do
	while [[ $dayStakes -ge 50 && $dayStakes -le 150 ]]
 	 do
		winOrLoose
		if [[ $dayStakes -eq 50 ]]
	 	 then
			echo "wins 50% of stakes"
			totalStakes=$(($totalStakes+$dayStakes))
			break
		elif [[ $dayStakes -eq 150 ]]
	 	 then
			echo "loses 50% of stakes"
			totalStakes=$(($totalStakes+$dayStakes))
			break
		fi
	done
	dayStakes=100
	((days++))
done

echo $totalStakes
