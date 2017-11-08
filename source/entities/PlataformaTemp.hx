package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.FlxAccelerometer;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PlataformaTemp extends FlxSprite 
{
	private var timer:Float ;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Piso_2__png, true, 16, 16);
		timer = 0;
		this.immovable = true;
	}
	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		addTime();
		die();
		comeBackVel();
		
		

	}
	private function die():Void
	{
		
		if (timer>50)
		{
			timer = 0;
		}
		
	}
	
	private function addTime():Void
	{
		if (alive) 
		timer += 1;
	}
	
	public function comeBackVel():Void
	{
		if (timer<25) 
		this.velocity.x = Reg.velPlat;
		else
		this.velocity.x = -Reg.velPlat;
		
	}
	
}