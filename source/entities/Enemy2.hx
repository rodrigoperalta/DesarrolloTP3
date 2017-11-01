package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.PowerUp;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;


/**
 * ...
 * @author ...
 */
class Enemy2 extends Enemy

{

	public function new(pU:FlxTypedGroup<PowerUp>,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(pU,X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.murcielago__png, true, 22, 17);		
		movement();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	public function movement():Void
	{
		velocity.x = -50;
		var v = y + 35;
		FlxTween.tween(this, { y: v }, 0.5, {type:FlxTween.PINGPONG, ease: FlxEase.sineInOut});
		
	}
}