extends Node

const Biome = preload("res://scripts/enums.gd").Biome
@onready var controlador_progresso = $progressbar_missoes
@onready var level_missions = $LevelMissions
@onready var game_main = $GameMain

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMissions.progress_updated.connect(_on_level_missions_progress_updated)
	level_missions.mission_state_changed.connect(controlador_progresso.update_mission_status)
	controlador_progresso.create_checklist(level_missions.missions)
	
	var total_inicial = $LevelMissions.missions.size()
	_on_level_missions_progress_updated(0, total_inicial)
	
	game_main.level_biome = Biome.PANTANAL
	game_main.generate_initial_tiles()


func _on_level_missions_progress_updated(completed_count, total_count):
	# 1. Calcular a porcentagem final aqui mesmo no nível
	var porcentagem_final = 0.0
	if total_count > 0:
		# (missões feitas / total de missões) * 100
		porcentagem_final = (float(completed_count) / total_count) * 100.0
	
	controlador_progresso.update_progressBar(porcentagem_final)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var river_size_sum = 0
	for size in game_main.river_sizes:
		river_size_sum += size
	
	$LevelMissions.update_mission_progress("areas_alagadas", river_size_sum)
	
	var forest_size_sum = 0
	for size in game_main.forest_sizes:
		forest_size_sum += size
		
	$LevelMissions.update_mission_progress("arvores_altas", forest_size_sum)
	
	if game_main.river_sizes.size() > 0:
		$LevelMissions.update_mission_progress("riqueza_aquatica", game_main.river_sizes.max())
