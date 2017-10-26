package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Guide extends FlxSprite 
{
	private var playerX:Float;
	private var playerY:Float;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(1, 1, 0x00000000);
		playerX = X;
	}
	
	override public function update(elapsed:Float):Void
	{
		this.x = playerX;		
		super.update(elapsed);
	}
	
	public function getPlayerPos(x:Float, y:Float)
	{			
		playerX = x;
		playerY = y;
	}
	
	
	
}