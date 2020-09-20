extends Node2D

func update_position(delta):
	if ($Movement.has_node("ConstantSpeed") and 
		$Movement.has_node("Path2D") and 
		$Movement/Path2D.has_node("PathFollow2D")):
		var update = delta * $Movement/ConstantSpeed.SPEED
		for condition in $ActiveConditions.get_children():
			if condition is ConditionSpeedMultiplier:
				update *= condition.SPEED_MULTIPLIER
		$Movement/Path2D/PathFollow2D.offset += update
		position = $Movement/Path2D/PathFollow2D.position
		return
	print("No movement specified in movement node.")
		

func take_damage(attack):
	if has_node("Health"):
		$Health.HP = max(0, $Health.HP - attack)
		$Health/Green.rect_scale = Vector2(float($Health.HP) / float($Health.MAX_HP), 1.0)
		if $Health.HP == 0:
			queue_free()
			

func _process(delta):
	if has_node("Movement"):
		update_position(delta)
