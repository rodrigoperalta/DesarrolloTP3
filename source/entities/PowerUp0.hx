package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PowerUp0 extends FlxSprite 
{

	private var timer:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.hacha__png, true, 19, 28);
		timer = 0;
		kill();
		
	}
	
	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		addTime();
		die();
		trace(this.y);
		

	}
	private function die():Void
	{
		
		if (timer>30)
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
	
	
	
}