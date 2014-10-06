package com.ukuleledog.games.castlevania.elements;
import motion.Actuate;
import motion.easing.Bounce;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author Matt
 */
class Succubus extends Enemy
{
	
	public function new() 
	{
		super();
		
		this.bmd = Assets.getBitmapData( 'img/spritesheet-npc.png' );
		
		createAnimation( 'idle', 0, 200, 1, 100, 50 );
		animate();
		
		scaleX = 2;
		scaleY = scaleX;
		
		speed = 15;
		points = 50;
				
		soundDie = Assets.getSound( 'snd/hit-bat.wav' );
		
		Actuate.tween( this, 2, { y: 105 } ).ease( Bounce.easeOut );
		
	}
	
	override public function move() : Void
	{
		/*if ( y < 105 )
			y += 5;*/
			
		x -= speed;
	}
		
}