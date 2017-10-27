package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Attack extends FlxSprite
{

	private var timer:Float;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(5, 5, 0xFFFFFF00);
		timer = 0;
		kill();
		x = 0;
		y = 0;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		addTime();
		die();

	}

	

	private function die():Void
	{
		
		if (timer>7)
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