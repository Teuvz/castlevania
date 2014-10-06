package com.ukuleledog.games.castlevania.elements;
import com.ukuleledog.games.core.AnimatedObject;
import flash.display.BitmapData;
import openfl.Assets;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Matt
 */
class Number extends AnimatedObject
{

	var h:UInt = 10;
	var w:UInt = 6;
	
	public function new() 
	{
		super();
		
		var imageData:BitmapData = Assets.getBitmapData( 'img/backdrop.png' );
		this.bmd = new BitmapData( w*10, h, true );
		this.bmd.copyPixels( imageData, new Rectangle( 0, 265, w*10, h), new Point( 0, 0) );
		
		createAnimation( '0', 0, 0, 1, h, w );
		createAnimation( '1', w, 0, 1, h, w );
		createAnimation( '2', w*2, 0, 1, h, w );
		createAnimation( '3', w*3, 0, 1, h, w );
		createAnimation( '4', w*4, 0, 1, h, w );
		createAnimation( '5', w*5, 0, 1, h, w );
		createAnimation( '6', w*6, 0, 1, h, w );
		createAnimation( '7', w*7, 0, 1, h, w );
		createAnimation( '8', w*8, 0, 1, h, w );
		createAnimation( '9', w * 9, 0, 1, h, w );
		
		animate('0');
	}
		
}