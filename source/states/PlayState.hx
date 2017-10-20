package states;

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
	//private var plat1:FlxSprite;
	//private var testito:FlxText;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var backGround:FlxBackdrop;
	private var guide:Guide;

	override public function create():Void
	{
		super.create();
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "Tilesets");
		player = new Player(0, 200);
		//backGround = new FlxBackdrop(AssetPaths.fondo__png);

		//testito = new FlxText(16, 16, 0, "", 5);

		/*plat1 = new FlxSprite(10, 200);
		plat1.makeGraphic(256, 5);
		plat1.immovable = true;*/
		
		FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		
		//FlxG.camera.follow(player);
		
		
		//add(backGround);
		add(tileMap);
		//add(plat1);
		//add(testito);
		add(player);

		//loader.loadEntities(entityCreator, "Entities");

		tileMap.setTileProperties(0, FlxObject.NONE);
		tileMap.setTileProperties(1, FlxObject.ANY);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		FlxG.collide(tileMap, player);
		//testito.text = player.currentState.getName();
	}

	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		/*switch (entityName)
		{
			case "Player":
				player = new Player();

				player.x = x;
				player.y = y;
				add(player);

			case "Enemy":
				var normalEne = new NormalEnemy( powerUps,eneBullets);
				normalEne.x = x;
				normalEne.y = y;
				enemies.add(normalEne);
				add(enemies);

		}*/
	}
}