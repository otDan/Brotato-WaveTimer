extends "res://ui/hud/ui_wave_timer.gd"

onready var hud: MarginContainer = get_tree().get_current_scene().get_node("UI/HUD")
var timer
var timer_field: RichTextLabel

func _ready()->void:
	visible = false
	timer = preload("res://mods-unpacked/otDan-WaveTimer/ui/hud/timer.tscn").instance()
	hud.margin_bottom = 0
	hud.anchor_bottom = 1
	hud.call_deferred("add_child", timer)
	hud.mouse_filter = MOUSE_FILTER_IGNORE
	timer_field = timer.get_node("%TimerField")
	timer.get_node("%Animation").play("timer_ticking")

func _process(_delta:float)->void:
	if wave_timer != null and is_instance_valid(wave_timer) and not is_run_lost:
		var time = ceil(wave_timer.time_left)

		if time > 0:
			timer.visible = true
		else:
			timer.visible = false
			return

		var color: String = "#ffffff"

		if change_color_on_half_wave and not color_changed and wave_timer.time_left <= wave_timer.wait_time / 2.0:
			color_changed = true

		if time <= 5:
			color = "#eb4444"
		elif color_changed:
			color = "#3dadcc"

		if timer_field != null:
			timer_field.bbcode_text = "[color=" + color + "][center]" + str(time) + "[/center][/color]"
