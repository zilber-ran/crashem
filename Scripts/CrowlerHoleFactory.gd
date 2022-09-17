extends SpawnFactory
class_name CrowlerHoleFactory

func get_player_position() -> Vector2:
	var parent = get_parent()
	var player = parent.get_node("BasicPlayer")
	return player.position

var vd = ValueDistorter.new()
onready var ctx = get_parent()
var crawler_holes = []

func _physics_process(delta):
	var expected_holes = ctx.get_total_crawler_holes()
	while crawler_holes.size() < expected_holes:
		var hole = load_and_spawn("CrawlerHole")
		crawler_holes.append(hole)
		logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole creation {} of {}", [crawler_holes.size(), expected_holes]))
		hole.activate(get_player_position())
