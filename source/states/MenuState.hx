package states;

import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.graphics.FlxGraphic;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import states.PlayState;
import openfl.Lib;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class MenuState extends FlxState 
{
	private var nombreGrupo:FlxText;
	
	override public function create() 
	{
		FlxG.mouse.visible = true;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var robocop = new FlxSprite(-70, 10, AssetPaths.A_RoboCop_logo__png);
		robocop.scale.set(0.5, 0.5);
		add(robocop);
		nombreGrupo = new FlxText (60, 220, 0, "© 2017 R.M.N industries", 10);
		var botonNuevoJuego = new FlxButton(x, 120, "New game", nuevo);
		var botonSalir = new FlxButton(x, 160, "Exit", salida);
		add(botonNuevoJuego);
		add(botonSalir);
		add(nombreGrupo);
		
	}
	
	private function nuevo()
	{
		FlxG.switchState(new PlayState());
	}
	
	private function salida()
	{
		Lib.close();
	}
	
}