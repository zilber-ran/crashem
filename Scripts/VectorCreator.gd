extends Area2D

signal vector_created(vector)

export var maximum_length := 20


var can_launch = true

var touch_down := false
var position_start := self.position
var position_end := self.position
var position_hit = self.position

var vector := Vector2.ZERO

func _ready() -> void:
	connect("input_event", self, "_on_input_event")

func _draw() -> void:
	draw_line(position_hit,
	position_hit, Color.green, 1.5)



func _reset() -> void:
	position_start = self.position
	position_end = Vector2.ZERO
	vector = Vector2.ZERO



func _raycast() -> void:
	var ray = get_node("RayCast2D")
	ray.cast_to = position_start-position_end
	ray.enabled = true
	position_hit = ray.get_collision_point()
	
	
	
	
func _input(event) -> void:
	if not touch_down:
		return
	
	if event.is_action_released("ui_touch"):
		touch_down = false
		emit_signal("vector_created",vector)
		_reset()
	
	
	if event is InputEventMouseMotion:
		position_end = event.position
		vector = -(position_end - position_start).clamped(maximum_length)
		_raycast()
		update()


func _on_input_event(_viewport, event, _shape_idx) -> void:
	if can_launch:
		
		if event.is_action_pressed("ui_touch"):
			touch_down = true
			position_start = event.position
		
