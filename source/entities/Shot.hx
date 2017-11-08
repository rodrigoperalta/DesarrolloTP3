package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Shot extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.bala__png);
		
	}
	
	
	override public function update (elapsed:Float):Void
	{
		super.update(elapsed);
		
	
		/*if (y<0) 
		{
			kill();
		}*/
	}
	
	
	
}