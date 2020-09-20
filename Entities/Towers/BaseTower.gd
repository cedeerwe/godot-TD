extends Node2D

func process_attacks(creeps):
	for attack in $Attacks.get_children():
		if attack.ready() and attack.triggered(creeps):		
			attack.attack(creeps)
