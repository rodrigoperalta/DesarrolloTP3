package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PowerUp3 extends FlxSprite 
{

	private var timer:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.boomerang__png, true, 19, 24);
		timer = 0;
		kill();
		
	}
	
	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		addTime();
		die();
		
		

	}
	private function die():Void
	{
		
		if (timer>50)
		{
			kill();
			timer = 0;
		}
		
	}
	
	private function addTime():Void
	{
		if (alive) 
		timer += 1;
	}
	
	public function comeBackVel():Float
	{
		if (timer<25) 
		return Reg.velPowerUp3;
		else
		return -Reg.velPowerUp3;
		
	}
	
	
}