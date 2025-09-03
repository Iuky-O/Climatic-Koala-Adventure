extends Control

@onready var credits = $MarginContainer/RichTextLabel

func _ready():
	credits.bbcode_enabled = true
	credits.bbcode_text = """

	[b]Créditos[/b]

	Assets:
	[url=https://limezu.itch.io/moderninteriors]Modern Interiors - LimeZu[/url]  
	[url=https://toffeecraft.itch.io/animal-mega-pack]Animal Mega Pack - ToffeeCraft[/url]  
	[url=https://nyknck.itch.io/citypackpixelart]City Pack Pixel Art - 
	NYKNCK[/url]  
	[url=https://emanuelledev.itch.io/farm-rpg]Farm RPG - EmanuelleDev[/url]  
	[url=https://kenmi-art.itch.io/cute-fantasy-rpg]Cute Fantasy RPG - Kenmi[/url]  
	[url=https://free-game-assets.itch.io/free-summer-pixel-art-backgrounds]Summer Pixel Art Backgrounds - Free and Premium Game Assets (GUI, Sprite, Tilesets)[/url]  
	[url=https://deep-fold.itch.io/pixel-planet-generator]Pixel Planet Generator - Deep-Fold[/url]  
	[url=https://narehop.itch.io/ps4-controller-buttons-free]PS4 Controller Buttons Free - Notokapixel[/url]  
	[url=https://gif-superretroworld.itch.io/character-pack]Character Pack - Gif[/url]  
	[url=https://butterymilk.itch.io/tiny-wonder-farm-asset-pack]Tiny Wonder Farm Asset Pack - Butter Milk[/url]  
	[url=https://n3cloud.itch.io/clover-valley-1616-farming-rpg-asset-pack]Clover Valley RPG Pack - Josee[/url]  

	
	Fontes:
	[url=https://www.fontyukle.net/font/Marke-Eigenbau-Normal]Marke Eigenbau - Fontyukle[/url]
	[url=https://www.fontyukle.net/font/revminipixel]Rev Mini Pixel - Fontyukle [/url]
	[url=https://www.dafont.com/panicko.font]Panicko - Dafont[/url]
	
	
	Música:
	[url=https://freesound.org/people/sando2611/sounds/785420/]TENSION DRAMA LOOP PIANO - Sando2611[/url]
	[url=https://opengameart.org/content/cosmic-cookie]Cosmic Cookie - Louswan[/url]
	[url=https://pixabay.com/music/video-games-8-bit-arcade-138828/]8 bit Arcade - Moodmode[/url]
	
	
	Agradecemos por jogar!
	"""
	credits.connect("meta_clicked", Callable(self, "_on_link_clicked"))

func _on_link_clicked(meta):
	OS.shell_open(str(meta))


func _on_sair_pressed() -> void:
	get_tree().change_scene_to_file("res://cena - cenarios/title_screen.tscn")
