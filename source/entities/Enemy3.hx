package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.PowerUp;

/**
 * ...
 * @author ...
 */
class Enemy3 extends Enemy
{
	private var timer:Float;
	private var eneBullets:FlxTypedGroup<Shot>;
	public function new(pU:FlxTypedGroup<PowerUp>,eB:FlxTypedGroup<Shot>, ?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(pU, X, Y, SimpleGraphic);
		eneBullets = eB;
		loadGraphic(AssetPaths.Canon__png, false, 16, 16);
		timer = 0;

	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		shoot(elapsed);
		trace(timer);

	}
	private function shoot(elapsed:Float):Void
	{
		timer += 1*elapsed;
		if (timer>3)
		{

			var bullet = new Shot(this.x+this.width/2, this.y + 5);
			eneBullets.add(bullet);
			FlxG.state.add(eneBullets);
			bullet.velocity.y = -Reg.velBullet;
			timer = 0;
		}

		

	}
}

