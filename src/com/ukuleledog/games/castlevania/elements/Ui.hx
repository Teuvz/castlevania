package com.ukuleledog.games.castlevania.elements;

import com.ukuleledog.games.core.GameObject;
import flash.display.BitmapData;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Matt
 */
class Ui extends Sprite
{

	private var points:Int = 314;
	private var pointsMax:Int = 999;
	
	private var number1:Number;
	private var number2:Number;
	private var number3:Number;
	
	public function new() 
	{
		super();
		
		var imageData:BitmapData = Assets.getBitmapData( 'img/backdrop.png' );
		var bmdData:BitmapData = new BitmapData( 100, 28, true );
		bmdData.copyPixels( imageData, new Rectangle( 0, 225, 100, 28), new Point( 0, 0) );
		
		this.graphics.beginBitmapFill( bmdData );
		this.graphics.drawRect( 0, 0, 100, 28 );
		this.graphics.endFill();
		
		this.scaleX = 2;
		this.scaleY = 2;
		
		number1 = new Number();
		number1.x = 4;
		number1.y = 17;
		addChild( number1 );
		
		number2 = new Number();
		number2.x = 10;
		number2.y = 17;
		addChild( number2 );
		
		number3 = new Number();
		number3.x = 16;
		number3.y = 17;
		addChild( number3 );
		
		updateDisplay();
		
	}
	
	public function addPoints( value:UInt )
	{
		points += value;
		
		if ( points > pointsMax )
			points = pointsMax;
			
		updateDisplay();
	}
	
	public function removePoints( value:UInt )
	{
		points -= value;
		
		if ( points < 0 )
			points = 0;
		
		updateDisplay();
	}
	
	private function updateDisplay()
	{
		if ( points > 99 )
		{
		number1.setAnimation( Std.string(points).charAt(0) );
		number2.setAnimation( Std.string(points).charAt(1) );
		number3.setAnimation( Std.string(points).charAt(2) );
		}
		else if ( points > 9 )
		{
			number1.setAnimation( '0' );
			number2.setAnimation( Std.string(points).charAt(0) );
			number3.setAnimation( Std.string(points).charAt(1) );
		}
		else
		{
			number1.setAnimation( '0' );
			number2.setAnimation( '0' );
			number3.setAnimation( Std.string(points).charAt(0) );
		}
		
	}
	
	public function getPoints() : Int
	{
		return points;
	}
	
}