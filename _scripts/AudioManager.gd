extends Node

# Dictionary to store loaded sounds for quick access
var sounds = {
	"clap": preload("res://Audio/SFX//applause.wav"),
	"drumroll": preload("res://Audio/SFX/Drumroll.wav"),
	"select": preload("res://Audio/SFX/Flashlight_Select.wav"),

	"narrator": preload("res://Audio/Voices/Voice_1.wav"),
		"narrator2": preload("res://Audio/Voices/Voice_2.wav"),
	"romeo": preload("res://Audio/Voices/Voice_4.wav"),
		"romeo2": preload("res://Audio/Voices/Voice_3.wav"),
	"juliet": preload("res://Audio/Voices/Voice_7.wav"),
	"juliet2": preload("res://Audio/Voices/Voice_6.wav"),
	"bear": preload("res://Audio/Voices/Voice_5.wav")
}
var voices = [
	preload("res://Audio/Voices/Voice_1.wav"),
	preload("res://Audio/Voices/Voice_2.wav"),
	preload("res://Audio/Voices/Voice_3.wav"),
	preload("res://Audio/Voices/Voice_4.wav"),
	preload("res://Audio/Voices/Voice_5.wav"),
]

var single_voices = [
	preload("res://Audio/Voices/Voice_1_single.wav"),
	preload("res://Audio/Voices/Voice_2_single.wav"),
	preload("res://Audio/Voices/Voice_3_single.wav"),
	preload("res://Audio/Voices/Voice_4_single.wav"),
	preload("res://Audio/Voices/Voice_5_single.wav"),
]

var sfxSequence = [ 
]

@export var musicPlayer : Node;
@export var sfxPlayer : Node;

func _ready():
	play_voice_sequence(["m",'f','n'])
	# play_music("drumroll",true,0.1)

func play_voice_sequence(order):
	sfxSequence.clear()
	for el in order:
		var nextVoice
		if el == "m":
			if sfxSequence.size() % 2 == 0:
				nextVoice = sounds["romeo"]
			else:
				nextVoice = sounds["romeo2"]
		elif el == "f":
			if sfxSequence.size() % 2 == 1:
				nextVoice = sounds["juliet"]
			else:
				nextVoice = sounds["juliet2"]
		elif  el == "n":
			if sfxSequence.size() % 2 == 0:
				nextVoice = sounds["narrator"]
			else:
				nextVoice = sounds["narrator2"]
		else:
			nextVoice = sounds["bear"]

		sfxSequence.append(nextVoice)

	sfxPlayer.stream = voices[1]
	sfxPlayer.volume_db = 1
	sfxPlayer.bus = &"SFX"
	sfxPlayer.connect("finished", Callable(self,"_continue_sfx_sequence").bind(sfxPlayer))
	_continue_sfx_sequence(sfxPlayer)
	sfxPlayer.play()

func play_sfx(sound_name: String, volume_db: float = 0.0):


	if sounds.has(sound_name) and sfxPlayer:
		var asp = sfxPlayer
		asp.stream = sounds[sound_name]
		asp.volume_db = volume_db
		asp.bus = &"SFX"
		asp.play()


func play_music(music_path: String, shouldLoop:bool,volume_db: float = 0.0):
	if sounds.has(music_path) and musicPlayer:
		var music_node = musicPlayer
		music_node.stream = sounds[music_path]
		music_node.volume_db = volume_db
		if shouldLoop:
			music_node.connect("finished", Callable(self,"_on_loop_sound").bind(music_node))
		play_audio(music_node,sounds[music_path],1)
		# music_node.play()

func play_audio(audioPlayer: Node, soundFile:AudioStream,volume_db: float = 0.0):
	if soundFile and audioPlayer:

		audioPlayer.stream = soundFile
		audioPlayer.volume_db = volume_db
		audioPlayer.play()

func _on_loop_sound(player):
	player.stream_paused = false
	player.play()

func _continue_sfx_sequence(player):
	if sfxSequence.size() == 0:
		player.stream_paused = true
		sfxSequence = [];
		return;
	player.stream_paused = false
	player.stream = sfxSequence[0]
	sfxSequence.remove_at(0)
	player.play()
