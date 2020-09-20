extends Node

var path1 = preload("res://Levels/1/Path1.tscn")
var path2 = preload("res://Levels/1/Path2.tscn")
var creep1 = preload("res://Entities/Creeps/Predefined/Godot.tscn")
var creep2 = preload("res://Entities/Creeps/Predefined/Unicorn.tscn")
var path_follow = preload("res://Components/Movement/PathFollow2D.tscn")
var tower1 = preload("res://Entities/Towers/Predefined/Sniper.tscn")
var tower2 = preload("res://Entities/Towers/Predefined/Freezing.tscn")

var num_creeps = 0
export var MAX_CREEPS = 10 

func _ready():
	$Towers.add_child(tower1.instance())
	# $Towers.add_child(tower2.instance())

func add_creep_with_path(creep_scene, path_scene, path_follow_scene):
	var creep_instance = creep_scene.instance()
	if creep_instance.get_node("Movement"):
		var path_instance = path_scene.instance()
		path_instance.add_child(path_follow_scene.instance())
		creep_instance.get_node("Movement").add_child(path_instance)
	creep_instance.connect("tree_exited", self, "creep_died")
	$Creeps.add_child(creep_instance)
	num_creeps += 1

func creep_died():
	num_creeps -= 1


func _on_SpawnTimer_timeout():
	if num_creeps < MAX_CREEPS:
		add_creep_with_path(creep1, path1, path_follow)
		add_creep_with_path(creep2, path2, path_follow)

func _process(_delta):
	var creeps = $Creeps.get_children()
	for tower in $Towers.get_children():
		tower.process_attacks(creeps)
