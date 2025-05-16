extends Control

signal missions_updated(missions: Dictionary)
signal match_score_updated(match_score: int)
signal task_progress_updated(completed: int, total: int)

@onready var mission_list = $VBoxContainer/MissionSection/CompletedMission
@onready var task_progress = $VBoxContainer/ProgressSection/TaskProgressConta
@onready var match_stars = $VBoxContainer/MatchSection/MatchStarsContain

func update_ui(missions: Dictionary, match_score: int):
	var names = missions.keys()
	mission_list.set_missions(names, missions)

	var completed = missions.values().count(true)
	task_progress.update_task_progress(completed, missions.size())
	match_stars.update_stars(match_score)
