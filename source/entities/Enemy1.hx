package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.PowerUp;

/**
 * ...
 * @author ...
 */
class Enemy1 extends Enemy
{

	

	public function new(pU:FlxTypedGroup<PowerUp>,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(pU,X, Y, SimpleGraphic);		
		loadGraphic(AssetPaths.enemigo__png, true, 26, 40);
		//scale.set(0.7, 0.7);
		updateHitbox();
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
		if(isOnScreen())
			velocity.x = -50;
	}
	
	public function die():Void
	{
		
	}
	

	
}