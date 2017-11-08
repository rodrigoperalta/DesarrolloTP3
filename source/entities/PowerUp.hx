package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class PowerUp extends FlxSprite
{
	private var pUType:Int;
	private var t(get, null):Int;
	public function new(type:Int, ?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset)
	{
		t = type;
		//t = 0;
		super(X, Y, SimpleGraphic);
		if (t == 0 )
		{
			makeGraphic(4, 4, FlxColor.RED);
		}
		if (t == 1 )
		{
			makeGraphic(4, 4, FlxColor.GREEN);
		}
		if (t == 2 )
		{
			makeGraphic(4, 4, FlxColor.WHITE);
		}
		if (t == 3 )
		{
			makeGraphic(4, 4, FlxColor.YELLOW);
		}
		if (t == 4)
		{
			makeGraphic(4, 4, FlxColor.BLUE);
		}

	}

	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		

	}
	
	public function get_t():Int 
	{
		return t;
	}

}