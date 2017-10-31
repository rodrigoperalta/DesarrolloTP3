package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Fire extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.tilesfuego__png, true, 16, 16);
		animation.add("moving", [0 , 1, 2], 8, true);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		animation.play("moving");
	}
}