package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/level.oel", "assets/data/level.oel");
			type.set ("assets/data/level.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/nivel.oep", "assets/data/nivel.oep");
			type.set ("assets/data/nivel.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/enemigo.png", "assets/images/enemigo.png");
			type.set ("assets/images/enemigo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fondo.jpg", "assets/images/Fondo.jpg");
			type.set ("assets/images/Fondo.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fondo.psd", "assets/images/Fondo.psd");
			type.set ("assets/images/Fondo.psd", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/images/murcielago.png", "assets/images/murcielago.png");
			type.set ("assets/images/murcielago.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Pinchos.png", "assets/images/Pinchos.png");
			type.set ("assets/images/Pinchos.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Pisodeslisante.png", "assets/images/Pisodeslisante.png");
			type.set ("assets/images/Pisodeslisante.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Robocop.png", "assets/images/Robocop.png");
			type.set ("assets/images/Robocop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilesfuego.png", "assets/images/tilesfuego.png");
			type.set ("assets/images/tilesfuego.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
