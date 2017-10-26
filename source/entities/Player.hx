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
		atk = new Attack();
		FlxG.state.add(atk);
		makeGraphic(5, 5, 0xFFFFFF00);
		acceleration.y = 1600;
		currentState = States.IDLE;
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
				
				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x != 0)
					currentState = States.RUN;

			case States.RUN:
				horizontalMovement();
				jump();

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
			velocity.x += 100;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 100;
	}

	private function jump():Void
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = -300;
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
