package entities;

import entities.Attack;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
/**
 * ...
 * @author yo
 */
enum States
{
	IDLE;
	RUN;
	JUMP;
	
}
class Player extends FlxSprite
{

	public var currentState(get, null):States;
	private var atk:Attack;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Robocop__png, true, 24, 48);
		animation.add("idle", [0, 1], 6, true);
		animation.add("run", [2, 9], 6, true);
		atk = new Attack();
		FlxG.state.add(atk);
		acceleration.y = 1600;
		currentState = States.IDLE;
		
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);
	}

	private function stateMachine():Void
	{
		attack();
		
		switch (currentState)
		{
			case States.IDLE:
				horizontalMovement();
				jump();
				animation.play("idle");
				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x != 0)
					currentState = States.RUN;

			case States.RUN:
				horizontalMovement();
				jump();
				animation.play("run");
				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x == 0)
					currentState = States.IDLE;

			case States.JUMP:
				
				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						currentState = States.IDLE;
					else
						currentState = States.RUN;
				}
				
					
		}
	}

	private function horizontalMovement():Void
	{
		velocity.x = 0;
		
		if (FlxG.keys.pressed.RIGHT)
		{	
			velocity.x += 100;
			facing = FlxObject.RIGHT;
		}
		if (FlxG.keys.pressed.LEFT)
		{	
			velocity.x -= 100;
			facing = FlxObject.LEFT;
		}
	}

	private function jump():Void
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = -600;
	}

	function get_currentState():States
	{
		return currentState;
	}

	public function attack():Void
	{
		
		if (FlxG.keys.justPressed.SPACE && !atk.alive)
		{
			atk.reset(this.x, this.y);
		
					

		}
			atk.velocity.x = 200;

		

	}
}
