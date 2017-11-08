package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PowerUp4 extends FlxSprite
{

	private var timer:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(50, 50, 0xFFFFFFFF);
		timer = 0;
		kill();

	}

	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		
		addTime();
		die();
		trace(this.height);
		trace(this.width);

	}
	private function die():Void
	{

		if (timer>15)
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