extends Node

class_name ConditionSpeedMultiplier

var SPEED_MULTIPLIER : float
var DURATION : float

func _ready():
	$Timer.wait_time = DURATION
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
