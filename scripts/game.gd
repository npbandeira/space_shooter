extends Node2D

@onready var player_spawn_position: Marker2D = $PlayerSpawnPosition
@onready var laser_container: Node2D = $LaserContainer

@export var player: Player

func _ready() -> void:
	assert(player!=null, 'Player not Defined')
	
	player.global_position = player_spawn_position.global_position
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		
func _on_player_laser_shot(laser_scene: PackedScene, location: Vector2) -> void:
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)
