extends ValueDistorter
class_name EnemyDistorter


var health_multiplyer : int = 1
var speed_multiplyer : int = 5
var timer_multiplyer : int = 0.5

func calc_health(difficulty):
	var ans = round_distort(difficulty*health_multiplyer)
	if ans == 0 :
		return(1)
	else:
		return(ans)

func calc_speed(difficulty):
	var ans = round_distort(difficulty*speed_multiplyer)
	return(ans)

func calc_timer(difficulty):
	var ans = distort(difficulty*timer_multiplyer)
	return(ans)
