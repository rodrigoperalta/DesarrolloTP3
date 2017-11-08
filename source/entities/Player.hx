package entities;

import entities.Attack;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
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
	private var powerUp0(get, null):PowerUp0;
	private var powerUp3(get, null):PowerUp3;
	private var powerUp4(get, null):PowerUp4;
	private var ammo:Int;
	private var powerUp0Side:Bool;
	private var timer:Float;
	//private var youdie:FlxText;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{

		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Robocop__png, true, 24, 48);
		animation.add("idle", [0, 1], 6, true);
		animation.add("run", [2, 9], 6, true);
		animation.add("jump", [11], 6, true);
		animation.add("attack", [12,18], 12, true);
		atk = new Attack();
		powerUp0 = new PowerUp0();
		powerUp3 = new PowerUp3();
		powerUp4 = new PowerUp4();
		FlxG.state.add(atk);
		FlxG.state.add(powerUp0);
		FlxG.state.add(powerUp3);
		FlxG.state.add(powerUp4);
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
		//youdie = new FlxText (x, 160, 0, "Press R to restart, Esc to quit", 10);
		
	}

	override public function update(elapsed:Float):Void
	{
		stateMachine();
		super.update(elapsed);
		//dieFire(elapsed);
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
				animation.play("attack");
				this.velocity.x = 0;
				attack();
				if (!atk.alive)
				{
					currentState = States.IDLE;
					if (!powerUp0.alive)
					{
						currentState = States.IDLE;
					}
					if (!powerUp3.alive)
					{
						currentState = States.IDLE;
					}
					if (!powerUp4.alive)
					{
						currentState = States.IDLE;
					}
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

			atk.reset(this.x + 8, this.y + 15);
			currentState = States.ATTACK;

		}

		if (FlxG.keys.justPressed.Z && ammo > 0 && !powerUp0.alive && !powerUp3.alive)
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

			if (powerUp == 4)
			{

				currentState = States.ATTACK;
				powerUp4.reset(this.x , this.y+10);
				ammo -= 1;

			}

		}

		if (facing == FlxObject.RIGHT)
		{
			atk.velocity.x = 200;
			powerUp3.velocity.x = powerUp3.comeBackVel();
			if (powerUp0.velocity.y ==0)
			{
				powerUp0.velocity.x = 400;
				powerUp0.velocity.y = -300;
			}

		}
		else
		{
			atk.velocity.x = -200;
			powerUp3.velocity.x = -powerUp3.comeBackVel();
			if (powerUp0.velocity.y ==0)
			{
				powerUp0.velocity.x = -400;
				powerUp0.velocity.y = -300;
			}
		}

	}

	public function getDamage(damage:Int)
	{
		if (lives<=0)
		{	
			this.kill();
			//youdie = new FlxText (x, 160, 0, "Press R to restart, Esc to quit", 10);
		}
		if (!FlxFlicker.isFlickering(this))
		{
			lives -= damage;
			if (lives >= 0)
				FlxFlicker.flicker(this, 3, 0.08, true, true);

		}
	}

	public function die():Void
	{
		lives--;
		if (lives==0)
		{
			this.kill();
			//youdie = new FlxText (this.x, this.y, 0, "Press R to restart, Esc to quit", 10);
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
	
	public function get_powerUp0():PowerUp0 
	{
		return powerUp0;
	}
	
	public function get_powerUp3():PowerUp3 
	{
		return powerUp3;
	}
	
	public function get_powerUp4():PowerUp4 
	{
		return powerUp4;
	}

}
