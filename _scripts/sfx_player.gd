extends Node

@onready var audio_manager: AudioManager = get_parent()

func play_applause():
	audio_manager.play_sfx("clap")

func play_drumroll():
	audio_manager.play_sfx("drumroll")

func play_select_spotlight():
	audio_manager.play_sfx("select")


