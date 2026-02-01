extends Node

# Dictionary to store loaded sounds for quick access
var sounds = {
	"clap": preload("res://Audio/SFX//applause.wav"),
	"drumroll": preload("res://Audio/SFX/Drumroll.wav"),
	"select": preload("res://Audio/SFX/Flashlight_Select.wav")
}

func _ready():
	# Optional: Set up audio buses (Master, Music, SFX)
	process_mode = Node.PROCESS_MODE_ALWAYS # Keep playing even when paused

## Play a sound effect by name
func play_sfx(sound_name: String, volume_db: float = 0.0):
	if sounds.has(sound_name):
		var asp = AudioStreamPlayer.new()
		asp.stream = sounds[sound_name]
		asp.volume_db = volume_db
		asp.bus = &"SFX" # Ensure you have an 'SFX' bus in your Audio tab
		
		add_child(asp)
		asp.play()
		
		# Clean up the node once the sound finishes
		asp.finished.connect(asp.queue_free)
	else:
		push_warning("Sound '" + sound_name + "' not found in AudioManager.")

## Play music with a simple fade-in/out logic (basic version)
func play_music(music_path: String):
	# You can expand this to handle crossfading between tracks
	var music_node = $MusicPlayer # Assume you added a child MusicPlayer node
	music_node.stream = load(music_path)
	music_node.play()