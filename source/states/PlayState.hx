package states;

import entities.Enemy1;
import entities.Guide;
import entities.Player;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.addons.display.FlxBackdrop;

class PlayState extends FlxState
{

	private var player:Player;
	private var enemy1:Enemy1;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var backGround:FlxBackdrop;
	private var guide:Guide;

	override public function create():Void
	{
		super.create();
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "Tilesets");
		loader.loadEntities(entityCreator, "Entities");
		
		guide = new Guide(player.x, FlxG.height/2);
		//backGround = new FlxBackdrop(AssetPaths.fondo__png);

		
	

		FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		
		FlxG.camera.follow(guide);

		//add(backGround);
		add(tileMap);
		add(guide);

		tileMap.setTileProperties(0, FlxObject.NONE);
		tileMap.setTileProperties(1, FlxObject.ANY);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guide.getPlayerPos(player.x, player.y);
		FlxG.collide(tileMap, player);
		
	}

private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		switch (entityName)
		{
			case "Player":
				player = new Player();

				player.x = x;
				player.y = y;
				add(player);

			case "Enemies":
				var enemy1 = new Enemy1();
				enemy1.x = x;
				enemy1.y = y;
				add(enemy1);
				

		}
	}
}