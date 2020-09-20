extends Node


# MAIN ATTACK SYSTEM
func apply_effect(creep):
	if $Effect.has_node("Damage"):
		creep.take_damage($Effect/Damage.DAMAGE)
	if $Effect.has_node("ChangeSpeed"):
		$Effect/ChangeSpeed.add_effect(creep)

# MAIN TARGET SYSTEM
func attack(creeps):
	if $Target.has_node("GlobalRandom"):
		var creep_count = creeps.size()
		if creep_count > 0:
			var creep = creeps[randi() % creep_count]
			apply_effect(creep)
			if $Ready.has_node("Cooldown"):
				$Ready/Cooldown.restart()
	elif $Target.has_node("All"):
		if creeps.size() > 0:
			for creep in creeps:
				apply_effect(creep)
			if $Ready.has_node("Cooldown"):
				$Ready/Cooldown.restart()
		

func ready():
	if $Ready.has_node("Cooldown"):
		return $Ready/Cooldown.is_ready()
	else:
		print("No active rule defined for tower")
		return false
	
func triggered(_creeps):
	if $Trigger/Always:
		return true
	else:
		print("No trigger defined for tower")
		return false
