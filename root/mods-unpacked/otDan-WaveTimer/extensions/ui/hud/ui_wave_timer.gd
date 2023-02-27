extends "res://ui/hud/ui_wave_timer.gd"

onready var hud: MarginContainer = get_parent().get_parent()
var timer
var timer_field: RichTextLabel

func _ready()->void:
	visible = false
	timer = preload("res://mods-unpacked/otDan-WaveTimer/ui/hud/timer.tscn").instance()
	hud.margin_bottom = 0
	hud.anchor_bottom = 1
	hud.call_deferred("add_child", timer)
	timer_field = timer.get_child(0).get_child(0).get_child(1).get_child(0)
	timer.get_child(1).play("timer_ticking")

func _process(_delta:float)->void:
	if wave_timer != null and is_instance_valid(wave_timer) and not is_run_lost:
		var time = ceil(wave_timer.time_left)
		var color: String = "#ffffff"

		if change_color_on_half_wave and not color_changed and wave_timer.time_left <= wave_timer.wait_time / 2.0:
			color = "#3dadcc"
			color_changed = true

		if time <= 5:
			color = "#eb4444"

		if timer_field != null:
			timer_field.bbcode_text = "[color=" + color + "][center]" + str(time) + "[/center][/color]"
