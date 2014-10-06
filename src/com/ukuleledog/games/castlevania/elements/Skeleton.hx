package com.ukuleledog.games.castlevania.elements;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author Matt
 */
class Skeleton extends Enemy
{
	
	public function new() 
	{
		super();
		
		this.bmd = Assets.getBitmapData( 'img/spritesheet-npc.png' );
		
		createAnimation( 'idle', 0, 100, 8, 50, 25, 0.2 );
		animate();
		
		scaleX = 2;
		scaleY = scaleX;
		
		speed = 3;
		points = 50;
		
		soundDie = Assets.getSound( 'snd/hit-skull.wav' );
		
	}
		
}