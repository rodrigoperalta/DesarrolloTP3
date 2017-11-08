package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.FlxAccelerometer;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PlataformaTemp extends FlxSprite 
{
	private var timer:Float ;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(5,5, 0xffffffff);
		timer = 0;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//trace(timer);
		create(elapsed);
		
	}
	
	private function create(elapsed:Float) :Void
	{
		timer += 1*elapsed;
		if (timer>4)
		{
			this.y -= 15;
			timer= 0;
		}
		
		
	}
	
}