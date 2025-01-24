class_name Player extends CharacterBody2D

@export var speed:int = 300
@export var rate_of_fire: float = 0.1

@onready var muzzle: Marker2D = $Muzzle

signal laser_shot(laser_scene: PackedScene, location: Vector2)

var laser_scene:PackedScene =  preload("res://scenes/lazer.tscn")

# flags
var shoot_cd: bool = false

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("shoot"):
		if !shoot_cd:
			shoot_cd = true
			shoot()
			await get_tree().create_timer(rate_of_fire).timeout
			shoot_cd = false
		
func _physics_process(delta: float) -> void:
	
	var direction:= Vector2(
		Input.get_axis("move_left","move_right"),
		Input.get_axis("move_up","move_down"))
	velocity = direction * speed
	
	move_and_slide()

func shoot() -> void:
	laser_shot.emit(laser_scene, muzzle.global_position)
