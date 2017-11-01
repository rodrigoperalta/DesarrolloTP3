package states;

import entities.Attack;
import entities.Deslizante;
import entities.Enemy1;
import entities.Guide;
import entities.Player;
import entities.Fire;
import entities.PowerUp;
import entities.Pinchos;
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
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var backGround:FlxBackdrop;
	private var guide:Guide;
	private var enemies1:FlxTypedGroup<Enemy1>;
	private var powerUps:FlxTypedGroup<PowerUp>;
	private var obspinchos:FlxTypedGroup<Pinchos>;
	private var obsfire:FlxTypedGroup<Fire>;
	private var obsdeslizante:FlxTypedGroup<Deslizante>;
	

	override public function create():Void
	{
		super.create();		
		enemies1 = new FlxTypedGroup<Enemy1>();
		powerUps = new FlxTypedGroup<PowerUp>();
		obsfire = new FlxTypedGroup<Fire>();
		obspinchos = new FlxTypedGroup<Pinchos>();
		obsdeslizante = new FlxTypedGroup<Deslizante>();
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
		add(obspinchos);
		add(obsdeslizante);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guide.getPlayerPos(player.x, player.y);
		FlxG.collide(tileMap, player);
		FlxG.collide(enemies1, player, colPlayerEnemy1);
		FlxG.collide(player.get_atk(), enemies1, colAttackEnemy1); 
		FlxG.overlap(obsfire, player, colPlayerObsFire);
		FlxG.overlap(obspinchos, player, colPlayerObsPincho);
		FlxG.collide(obsdeslizante, player, colPlayerObsDeslizante);
	
		if (FlxG.keys.justPressed.R)
			FlxG.resetState();
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
				var enemy1 = new Enemy1(powerUps);
				enemy1.x = x;
				enemy1.y = y;
				enemies1.add(enemy1);
				add(enemies1);
				
	        
			case "Fire":
				var obstaculoFire = new Fire();
				obstaculoFire.x = x;
				obstaculoFire.y = y;
				obsfire.add(obstaculoFire);
				add(obsfire);
				
			
			case "Pinchos":
				var obstaculoPincho = new Pinchos();
				obstaculoPincho.x = x;
				obstaculoPincho.y = y;
				obspinchos.add(obstaculoPincho);
				add(obspinchos);
			
			case "Deslizante":
				var obstaculoDeslizante = new Deslizante();
				obstaculoDeslizante.x = x;
				obstaculoDeslizante.y = y;
				obsdeslizante.add(obstaculoDeslizante);
				add(obsdeslizante);
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
	
	private function colPlayerObsPincho(pi:Pinchos, p:Player):Void
	{
	  p.die();
	}
	
	private function colPlayerObsDeslizante(d:Deslizante, p:Player):Void
	{
		/*if(p.velocity.x > 0)
			p.velocity.x += 100;
		else 
			p.velocity.x -= 100;
			*/
		p.velocity.set(100, 0);
		trace ("holis");
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
}