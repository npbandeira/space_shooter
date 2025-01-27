class_name Lazer extends Area2D

@export var speed: int = 600

func _physics_process(delta: float) -> void:
	global_position.y += -speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.die()
		queue_free()
