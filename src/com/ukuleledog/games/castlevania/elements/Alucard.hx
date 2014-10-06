package com.ukuleledog.games.castlevania.elements;

import com.ukuleledog.games.core.AnimatedObject;
import haxe.Timer;
import openfl.Assets;

/**
 * ...
 * @author Matt
 */
class Alucard extends AnimatedObject
{

	private var playable:Bool = true;
	
	public function new() 
	{
		super();
		
		this.bmd = Assets.getBitmapData('img/spritesheet.png');
		
		createAnimation( 'idle', 0, 0, 6, 50, 50, 0.15 );
		createAnimation( 'walk', 0, 50, 16, 50, 50, 0.05 );
		createAnimation( 'crouch', 0, 100, 11, 50, 50, 0.05, false );
		createAnimation( 'fall', 0, 150, 6, 50, 50, 0.1, false );
		createAnimation( 'hurt1', 0, 200, 1, 50, 50, 0.5, false );
		createAnimation( 'hurt2', 50, 200, 1, 50, 50, 0.5, false );
		createAnimation( 'hurt3', 100, 200, 1, 50, 50, 0.5, false );
		createAnimation( 'hurt4', 150, 200, 1, 50, 50, 0.5, false );
		createAnimation( 'hit1', 150, 250, 3, 50, 50, 0.05, false );
		createAnimation( 'hit2', 0, 250, 2, 50, 60, 0.05, false );
		
		animate('idle');
		
		//Timer.delay( function() { animate('idle'); playable = true; }, 900 );
		
		this.scaleX = 2;
		this.scaleY = 2;
	}
	
	public function setPlayable( value:Bool )
	{
		playable = value;
	}
	
	public function isPlayable() : Bool
	{
		return playable;
	}
	
}