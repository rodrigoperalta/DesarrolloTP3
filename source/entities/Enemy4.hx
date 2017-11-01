package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.PowerUp;


/**
 * ...
 * @author ...
 */
class Enemy4 extends Enemy 
{

	public function new(pU:FlxTypedGroup<PowerUp>, ?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(pU, X, Y, SimpleGraphic);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		
	}
	
	public function movement():Void
	{
		velocity.x = -50;
	}
}