package com.ukuleledog.games.castlevania.elements;
import openfl.Assets;
import flash.events.Event;

/**
 * ...
 * @author Matt
 */
class Nymph extends Enemy
{
	
	private var backing:Bool = false;
	private var attacking:Bool = false;
	
	public function new() 
	{
		super();
		
		this.bmd = Assets.getBitmapData( 'img/spritesheet-npc.png' );
		
		createAnimation( 'idle', 0, 150, 6, 50, 25, 0.1 );
		createAnimation( 'back', 150, 150, 3, 50, 50, 0.1 );
		createAnimation( 'attack', 150, 200, 1, 50, 50 );
		animate();
		
		scaleX = 2;
		scaleY = scaleX;
		
		points = 100;
		soundDie = Assets.getSound( 'snd/hit-bat.wav' );
		
	}

	override public function move() : Void
	{
		
		//trace( x );
		
		if ( x > 250 && backing == false || attacking == true )
		{
			x -= speed;
		}
		else if ( attacking == false )
		{
			
			if ( backing == false )
			{
				backing = true;
				setAnimation( 'back' );
				speed = 20;
			}
			
			x += speed;
			
			if ( x > 400 )
			{
				attacking = true;
				setAnimation('attack');
				speed = 30;
			}
			
		}
		
	}
		
}