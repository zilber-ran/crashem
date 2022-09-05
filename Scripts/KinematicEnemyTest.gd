extends KinematicBody2D



func _on_Area2D_body_entered(body):
	print(body, " entered")
	get_parent().remove_child(self)
