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
		/*loadGraphic(AssetPaths.ammo__png, true, 12, 17);
		animation.add("ammo", [0], 1, false);
		loadGraphic(AssetPaths.vida__png, true, 20, 18);
		animation.add("vida", [0], 1, false);
		loadGraphic(AssetPaths.boomerang__png, true, 19, 24);
		animation.add("boomerang", [0], 1, false);
		loadGraphic(AssetPaths.hacha__png, true, 19, 28);
		animation.add("hacha", [0], 1, f alse);*/

		t = type;
		//t = 4;
		super(X, Y, SimpleGraphic);
		if (t == 0 )
		{
			loadGraphic(AssetPaths.hacha__png, true, 19, 28);
			scale.set(0.5, 0.5);
		}
		if (t == 1 )
		{
			loadGraphic(AssetPaths.ammo__png, true, 12, 17);
			scale.set(0.5, 0.5);
		}
		if (t == 2 )
		{
			loadGraphic(AssetPaths.vida__png, true, 20, 18);
			scale.set(0.5, 0.5);
		}
		if (t == 3 )
		{
			loadGraphic(AssetPaths.boomerang__png, true, 19, 24);
			scale.set(0.5, 0.5);
		}
		if (t == 4)
		{
			loadGraphic(AssetPaths.shield__png, true, 20, 15);
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