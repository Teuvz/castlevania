package com.ukuleledog.games.castlevania.elements;
import openfl.Assets;
import flash.events.Event;

/**
 * ...
 * @author Matt
 */
class Skull extends Enemy
{

	private var heartbeat:UInt = 0;
	private var amplitude:UInt = 20;
	
	public function new() 
	{
		super();
		
		this.bmd = Assets.getBitmapData( 'img/spritesheet-npc.png' );
		
		createAnimation( 'idle', 0, 0, 3, 30, 50, 0.2 );
		animate();
		
		scaleX = 2;
		scaleY = scaleX;
		
		speed = 7;
		this.alpha = 0.7;
		points = 20;
		
		soundDie = Assets.getSound( 'snd/hit-skull.wav' );
		
		//addEventListener( Event.ENTER_FRAME, loop );
		//addEventListener( Event.REMOVED_FROM_STAGE, kill );
	}
	
	override public function move() : Void
	{
		this.y += ( Math.sin(heartbeat++) * amplitude );
		this.x -= speed;
	}
	
}