package states;

import entities.Attack;
import entities.Enemy1;
import entities.Enemy2;
import entities.Enemy3;
import entities.Enemy4;
import entities.Guide;
import entities.Player;
import entities.Fire;
import entities.PowerUp;
import entities.Shot;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{

	private var player:Player;
	private var enemy1:Enemy1;
	private var enemy2:Enemy2;
	private var enemy3:Enemy3;
	private var enemy4:Enemy4;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var backGround:FlxBackdrop;
	private var guide:Guide;
	private var enemies1:FlxTypedGroup<Enemy1>;
	private var enemies2:FlxTypedGroup<Enemy2>;
	private var enemies3:FlxTypedGroup<Enemy3>;
	private var enemies4:FlxTypedGroup<Enemy4>;
	private var powerUps:FlxTypedGroup<PowerUp>;
	private var obsfire:FlxTypedGroup<Fire>;
	private var enemybullet:FlxTypedGroup<Shot>;
	

	override public function create():Void
	{
		super.create();		
		enemies1 = new FlxTypedGroup<Enemy1>();
		enemies2 = new FlxTypedGroup<Enemy2>();
		enemies3 = new FlxTypedGroup<Enemy3>();
		enemies4 = new FlxTypedGroup<Enemy4>();
		powerUps = new FlxTypedGroup<PowerUp>();
		obsfire = new FlxTypedGroup<Fire>();	
		enemybullet = new FlxTypedGroup<Shot>();
		
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "Tilesets");
		loader.loadEntities(entityCreator, "Entities");
		
		guide = new Guide(player.x, FlxG.height/2);
		//backGround = new FlxBackdrop(AssetPaths.Fondo__jpg);

		
	

		FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		
		FlxG.camera.follow(guide);
		FlxG.camera.setScrollBounds(0, tileMap.width, 0, tileMap.height);
        checkTileCollision();
		//add(backGround);
		add(tileMap);
		add(guide);
		add(obsfire);
		

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guide.getPlayerPos(player.x, player.y);
		FlxG.collide(tileMap, player);
		FlxG.collide(enemies1, player, colPlayerEnemy1);
		FlxG.collide(player.get_atk(), enemies1, colAttackEnemy1); 
		FlxG.overlap(obsfire, player, colPlayerObsFire);
		FlxG.collide(enemies4 , tileMap);
		enemies4.forEachAlive(checkEnemyVision);
	
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
				player.y = y-100;
				add(player);

			case "Enemies1":
				var enemy1 = new Enemy1(powerUps, x, y);
				enemies1.add(enemy1);
				add(enemies1);
				
	        case "Enemies2":
				var enemy2 = new Enemy2(powerUps, x, y);
				enemies2.add(enemy2);
				add(enemy2);
				
			case "Enemies3":
				var enemy3 = new Enemy3(powerUps, enemybullet,x, y);
				enemies3.add(enemy3);
				add(enemies3);
				
	        case "Enemies4":
				var enemy4 = new Enemy4(powerUps, x, y);
				enemies4.add(enemy4);
				add(enemy4);
			
			case "Fire":
				var obstaculoFire = new Fire();
				obstaculoFire.x = x;
				obstaculoFire.y = y;
				obsfire.add(obstaculoFire);
				add(obsfire);
		}
	}
	
	private function colPlayerEnemy1(e:Enemy1, p:Player):Void
	{
		enemies1.remove(e, true);
		player.die();		
	}
	
	private function colPlayerObsFire(f:Fire, p:Player):Void
	{
	  p.die();
	}
	private function colAttackEnemy1(a:Attack, e:Enemy1):Void
	{
		enemies1.remove(e, true);	
		e.dropPowerUp();
	}
	
	private function checkTileCollision():Void
	{
		tileMap.setTileProperties(0, FlxObject.NONE);
		tileMap.setTileProperties(1, FlxObject.ANY);
		tileMap.setTileProperties(2, FlxObject.ANY);
	}
	private function checkEnemyVision(e:Enemy4):Void
	{
		if (tileMap.ray(e.getMidpoint(), player.getMidpoint()))
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(player.getMidpoint());
		}
		else
			e.seesPlayer = false;
	}
}