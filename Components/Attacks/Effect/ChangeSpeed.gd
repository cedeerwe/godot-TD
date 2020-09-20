extends Node

export var SPEED_MULTIPLIER : float
export var DURATION: float

var speed_multiplier_scene = preload("res://Components/Condition/SpeedMultiplier.tscn")

func add_effect(creep):
	var speed_multiplier = speed_multiplier_scene.instance()
	speed_multiplier.SPEED_MULTIPLIER = SPEED_MULTIPLIER
	speed_multiplier.DURATION = DURATION
	creep.get_node("ActiveConditions").add_child(speed_multiplier)
