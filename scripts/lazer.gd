class_name Lazer extends Area2D

@export var speed: int = 600

func _physics_process(delta: float) -> void:
	global_position.y += -speed * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free() # Replace with function body.
