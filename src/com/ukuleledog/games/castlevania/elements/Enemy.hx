package com.ukuleledog.games.castlevania.elements;

import com.ukuleledog.games.core.AnimatedObject;
import flash.media.Sound;

/**
 * ...
 * @author Matt
 */
class Enemy extends AnimatedObject
{

	public var speed:UInt = 10;
	public var soundDie:Sound;
	public var points:UInt = 10;
	
	public function new() 
	{
		super();
		
	}
	
	public function move() : Void
	{
		x -= speed;
	}
	
}