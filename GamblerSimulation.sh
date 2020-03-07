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
monthDays=20
wonDays=0
lostDays=0

while [[ $days -le $monthDays ]]
do
	while [[ $dayStakes -ge 50 && $dayStakes -le 150 ]]
 	 do
		winOrLoose
		if [[ $dayStakes -eq 150 ]]
	 	 then
			((wonDays++))
			totalStakes=$(($totalStakes+$dayStakes))
			break
		elif [[ $dayStakes -eq 50 ]]
	 	 then
			((lostDays++))
			totalStakes=$(($totalStakes+$dayStakes))
			break
		fi
	done
	dayStakes=100
	((days++))
done
echo "wining days $wonDays"
echo "lost days $lostDays"
echo "Total stakes remaining to Gambler $totalStakes"

wonBy=0
lostBy=0
if [[ $totalStakes -gt 2000 ]]
 then
	wonBy=$(($totalStakes-2000))
	echo "This month Gambler won by $wonBy stakes"
 elif [[ $totalStakes -lt 2000 ]]
 then
	lostBy=$((2000-$totalStakes))
	echo "This month Gambler lost by $lostBy stakes"
 elif [[ $totalStakes -eq 2000 ]]
 then
	echo "Gambler not won or loss any stakes"
fi
