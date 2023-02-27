extends Node

const MOD_NAME = "otDan-WaveTimer"

var dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", MOD_NAME)
	dir = modLoader.UNPACKED_DIR + MOD_NAME + "/"

	modLoader.install_script_extension(dir + "extensions/ui/hud/ui_wave_timer.gd")

func _ready():
	ModLoaderUtils.log_info("Readying", MOD_NAME)
	ModLoaderUtils.log_success("Loaded", MOD_NAME)
