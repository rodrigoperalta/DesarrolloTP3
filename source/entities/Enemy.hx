package entities;
import entities.PowerUp;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite 
{
	
	
	
	private var timerPU:Int;
	private var powerUps:FlxTypedGroup <PowerUp>;

	public function new(pU:FlxTypedGroup<PowerUp>, ?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		powerUps = pU;
		super(X, Y, SimpleGraphic);
		
		timerPU = 0;
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timerPU += 1;
		if (timerPU>50)
		timerPU = 0;	
	}
	
	public function dropPowerUp():Void
	{
		
		if (timerPU % 5 == 0) 
		{
			var powerUp = new PowerUp(this.x, this.y);
			powerUps.add(powerUp);
			FlxG.state.add(powerUps);			
			
		}
		
	}
	
}