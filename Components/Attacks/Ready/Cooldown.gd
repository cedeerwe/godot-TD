extends Node

export var COOLDOWN: float

func _ready():
	$Timer.wait_time = COOLDOWN
	
func restart():
	$Timer.start()
	
func is_ready():
	return $Timer.time_left <= 0
