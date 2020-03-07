#!/bin/bash -x

#Problem Statement : Gambler Simulation
#Discription : This problem simulates a Gambler. Being a Calculative Gambler exits if the Stake reaches a high or a low limit.
#Author : Kunal Jadhav
#Date : 7 March 2020

dayStakes=100
bet=1
days=0

function winOrLoose() {
	state=$((RANDOM%2))
	if  [[ $state -eq 1 ]]
	 then
		dayStakes=$(($dayStakes+1))
	 else
		dayStakes=$(($dayStakes-1))
	fi
}
winOrLoose
