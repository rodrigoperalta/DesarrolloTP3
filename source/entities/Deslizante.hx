package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Deslizante extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Pisodeslisante__png, true, 16, 20);
		//immovable = true;
		height = 20;
		
		
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	
}