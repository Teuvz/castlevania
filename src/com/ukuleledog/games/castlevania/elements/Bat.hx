package com.ukuleledog.games.castlevania.elements;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author Matt
 */
class Bat extends Enemy
{

	private var heartbeat:UInt = 0;
	private var amplitude:UInt = 20;
	
	public function new() 
	{
		super();
		
		this.bmd = Assets.getBitmapData( 'img/spritesheet-npc.png' );
		
		createAnimation( 'idle', 0, 50, 10, 50, 25, 0.08 );
		animate();
		
		scaleX = 2;
		scaleY = scaleX;
		
		speed = 7;
		
		soundDie = Assets.getSound( 'snd/hit-bat.wav' );
		
		//addEventListener( Event.ENTER_FRAME, loop );
		//addEventListener( Event.REMOVED_FROM_STAGE, kill );
	}
	
	private function loop( e:Event )
	{
		this.y += ( Math.sin(heartbeat++) * amplitude );
	}
	
}