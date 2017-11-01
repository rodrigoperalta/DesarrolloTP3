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
	ATTACK;

}
class Player extends FlxSprite
{

	public var currentState(get, null):States;
	private var atk(get, null):Attack;
	private var lives:Int;
	private var powerUp:Int;
	private var powerUp0:PowerUp0;
	private var ammo:Int;
	private var powerUp0Side:Bool;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Robocop__png, true, 24, 48);
		animation.add("idle", [0, 1], 6, true);
		animation.add("run", [2, 9], 6, true);
		animation.add("jump", [11], 6, true);
		atk = new Attack();
		powerUp0 = new PowerUp0();
		FlxG.state.add(atk);
		FlxG.state.add(powerUp0);
		acceleration.y = 1600;
		currentState = States.IDLE;
		lives = 10;
		width = 15;
		ammo = 5;
		offset.x = 2;
		//height = 190;
		//offset.set(130, 20);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		//if (setFacingFlip(LEFT))
		//	offset.x = 0;
	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);

	}

	private function stateMachine():Void
	{

		switch (currentState)
		{
			case States.IDLE:
				attack();
				horizontalMovement();
				jump();
				animation.play("idle");
				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x != 0)
					currentState = States.RUN;

			case States.RUN:
				attack();
				horizontalMovement();
				jump();
				animation.play("run");
				if (velocity.y != 0)
					currentState = States.JUMP;
				else if (velocity.x == 0)
					currentState = States.IDLE;

			case States.JUMP:
				attack();
				animation.play("jump");

				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						currentState = States.IDLE;
					else
						currentState = States.RUN;
				}

			case States.ATTACK:
				attack();
				this.velocity.x = 0;
				if (!atk.alive)
				{
					currentState = States.IDLE;
				}
				if (!powerUp0.alive)
				{
					currentState = States.IDLE;
				}

		}
	}

	private function horizontalMovement():Void //esta haciendo conflicto con el objeto deslizante
	{
		velocity.x = 0; //esto hace que no se mueva al parecer
		
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
		{
			velocity.y = -400;

		}
	}

	function get_currentState():States
	{
		return currentState;
	}

	public function attack():Void
	{

		if (FlxG.keys.justPressed.SPACE && !atk.alive)
		{
			currentState = States.ATTACK;
			atk.reset(this.x + 8, this.y + 15);

		}

		if (FlxG.keys.justPressed.Z && ammo > 0 && !powerUp0.alive)
		{
			if (powerUp == 0)
			{

				currentState = States.ATTACK;
				powerUp0.reset(this.x + 8, this.y + 15);
				powerUp0.acceleration.y = 1600;
				ammo -= 1;

			}

			if (powerUp == 3)
			{

				currentState = States.ATTACK;
				powerUp3.reset(this.x + 8, this.y + 15);
				ammo -= 1;

			}
		}

		if (facing == FlxObject.RIGHT)
		{
			atk.velocity.x = 200;
			if (powerUp0.velocity.y ==0)
			{
				powerUp0.velocity.x = 400;
				powerUp0.velocity.y = -300;
			}

		}
		else
		{
			atk.velocity.x = -200;
			if (powerUp0.velocity.y ==0)
			{
				powerUp0.velocity.x = -400;
				powerUp0.velocity.y = -300;
			}
		}

	}

	public function die():Void
	{
		lives--;
		if (lives==0)
		{
			this.kill();
		}
	}

	public function get_atk():Attack
	{
		return atk;
	}

	public function getPowerUp(pU:Int):Void
	{
		powerUp = pU;
		if (powerUp == 1)
		{
			ammo += 5;
		}

		if (powerUp == 2)
		{
			lives += 5;
		}
	}

}
