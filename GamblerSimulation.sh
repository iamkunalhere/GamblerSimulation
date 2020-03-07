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
		((wCountInDay++))
	 else
		dayStakes=$(($dayStakes-1))
		((lCountInDay++))
	fi
}
function GambleMonth() {
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
	if [[ $wCountInDay -gt $maxWinCount ]]
	 then
		maxWinCount=$wCountInDay
		maxWinDay=$days
	 elif [[ $lCountInDay -gt $maxLostCount ]]
	 then
		maxLostCount=$lCountInDay
		maxLostDay=$days
	fi
	dayStakes=100
	((days++))
	wCountInDay=0
	lCountInDay=0
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
echo "luckiest Day is $maxWinDay"
echo "unluckiest Day is $maxLostDay"
}
x=0
while [[ $x -eq 0 ]]
 do
	wCountInDay=0
	lCountInDay=0
	dayStakes=100
	bet=1
	totalStakes=0
	days=1
	monthDays=20
	wonDays=0
	lostDays=0
	maxWinCount=0
	maxLostCount=0
	maxWinDay=0
	maxLostDay=0
	totalStakes=0
	GambleMonth
	read -p "Would u like to play for a month y/n ?" choice
	if [[ $choice == y ]]
	 then
		x=0
	else
		x=1
	fi
done
