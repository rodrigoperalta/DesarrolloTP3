package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy1 extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.enemigo__png, true, 26, 40);
		scale.set(0.7, 0.7);
		animation.add("idle", [0], 1, false);
		animation.add("moving", [1], 1, false);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		animation.play("moving");
	}
	
	public function movement():Void
	{
		velocity.x = -50;
	}
	
}