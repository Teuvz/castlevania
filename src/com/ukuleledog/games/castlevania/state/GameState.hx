package com.ukuleledog.games.castlevania.state;

import com.ukuleledog.games.castlevania.elements.Alucard;
import com.ukuleledog.games.castlevania.elements.Enemy;
import com.ukuleledog.games.castlevania.elements.Nymph;
import com.ukuleledog.games.castlevania.elements.Skeleton;
import com.ukuleledog.games.castlevania.elements.Skull;
import com.ukuleledog.games.castlevania.elements.Bat;
import com.ukuleledog.games.castlevania.elements.Succubus;
import com.ukuleledog.games.castlevania.elements.Ui;
import com.ukuleledog.games.core.State;
import flash.display.BitmapData;
import flash.utils.Timer;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import flash.utils.Dictionary;
import flash.ui.Keyboard;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import flash.events.TimerEvent;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

/**
 * ...
 * @author Matt
 */
class GameState extends State
{

	private var keysPressed:Array<Bool>;
	private var hitTimer:Timer;
	
	private var background:Bitmap;
	private var foreground:Bitmap;
	private var foregroundShadow:Bitmap;
	
	private var ui:Ui;
	
	private var alucard:Alucard;
	private var enemy:Enemy;
	private var hitting:Bool = false;
	
	private var sndc:SoundChannel;
	private var soundHit1:Sound;
	private var soundHit2:Sound;
	private var soundHitAlucard:Sound;
	
	public function new() 
	{
		super();
		
		addEventListener( Event.ADDED_TO_STAGE, init );		
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		var imageData:BitmapData = Assets.getBitmapData( 'img/backdrop.png' );
		var bgData:BitmapData = new BitmapData( 255, 207, false );
		bgData.copyPixels( imageData, new Rectangle( 0, 0, 255, 207), new Point( 0, 0) );
		var fgData:BitmapData = new BitmapData( 255, 207, true );
		fgData.copyPixels( imageData, new Rectangle( 255, 0, 255, 207), new Point( 0, 0) );
		var fgsData:BitmapData = new BitmapData( 255, 207, true );
		fgsData.copyPixels( imageData, new Rectangle( 510, 0, 255, 207), new Point( 0, 0) );
		
		background = new Bitmap(bgData);
		background.width = stage.stageWidth;
		background.scaleY = background.scaleX;
		addChild( background );
		
		alucard = new Alucard();
		alucard.y = 220;
		alucard.x = 120;
		addChild( alucard );
		
		foregroundShadow = new Bitmap(fgsData);
		foregroundShadow.width = stage.stageWidth;
		foregroundShadow.scaleY = foregroundShadow.scaleX;
		foregroundShadow.alpha = 0.5;
		addChild( foregroundShadow );
		
		var cache:Sprite = new Sprite();
		cache.graphics.beginFill( 0x000000 );
		cache.graphics.drawRect( 0, 0, stage.stageWidth, 150 );
		cache.graphics.endFill();
		addChild( cache );
		
		foreground = new Bitmap(fgData);
		foreground.width = stage.stageWidth;
		foreground.scaleY = foreground.scaleX;
		addChild( foreground );
		
		ui = new Ui();
		ui.x = 5;
		ui.y = ui.x;
		addChild( ui );
		
		generateEnemy();
		
		keysPressed = new Array();
		
		hitTimer = new Timer(2000);
		hitTimer.addEventListener( TimerEvent.TIMER, hitTimerHandle );
		
		var sound:Sound = Assets.getMusic( 'music/music.mp3' );
		var trans:SoundTransform = new SoundTransform( 0.2 );
		sndc = sound.play(0, 0, trans);
		soundHitAlucard = Assets.getSound( 'snd/hit-alucard.wav' );
		
		soundHit1 = Assets.getSound( 'snd/hit1.wav' );
		soundHit2 = Assets.getSound( 'snd/hit2.wav' );
		
		stage.addEventListener( KeyboardEvent.KEY_DOWN, keyDownHandle );
		stage.addEventListener( KeyboardEvent.KEY_UP, keyUpHandle );
		addEventListener( Event.ENTER_FRAME, gameloop );
	}
		
	private function keyDownHandle( e:KeyboardEvent )
	{			
		keysPressed[e.keyCode] = true;
	}
	
	private function keyUpHandle( e:KeyboardEvent )
	{
		keysPressed[e.keyCode] = false;
	}
	
	private function gameloop( e:Event )
	{		
		if ( keysPressed[Keyboard.DOWN] == true && alucard.isPlayable() )
		{
			alucard.setAnimation( 'crouch' );
		}
		else if ( keysPressed[Keyboard.Z] == true && alucard.isPlayable() )
		{
			hitting = true;
			alucard.setAnimation( 'hit1' );
			hitTimer.delay = 300;
			hitTimer.start();
			alucard.setPlayable( false );
			soundHit1.play();
			
			if ( alucard.hitTestObject( enemy ) )
			{
				ui.addPoints( enemy.points );
				enemy.soundDie.play();
				killEnemy();
			}
			
		}
		else if ( keysPressed[Keyboard.A] == true && alucard.isPlayable() )
		{
			hitting = true;
			alucard.setAnimation( 'hit2' );
			hitTimer.delay = 300;
			hitTimer.start();
			alucard.setPlayable( false );
			soundHit2.play();
			
			if ( alucard.hitTestObject( enemy ) )
			{
				ui.addPoints( enemy.points );
				enemy.soundDie.play();
				killEnemy();
			}
			
		}
		else if ( alucard.isPlayable() )
		{
			alucard.setAnimation( 'idle' );
		}
		
		// enemy		
		enemy.move();
		
		if ( enemy.x <= 0 )
		{
			killEnemy();
		}
		
		if ( alucard.hitTestObject( enemy ) && alucard.isPlayable() == true )
		{
			ui.removePoints( enemy.points );
			soundHitAlucard.play();
			hitTimer.delay = 2000;
			hitTimer.start();
			alucard.setPlayable( false );
			alucard.setAnimation( 'hurt' + ( (Math.round(Math.random() * 3) + 1) ) );
		}
		
	}
	
	private function hitTimerHandle( e:TimerEvent )
	{
		hitting = false;
		hitTimer.stop();

		alucard.setPlayable( true );
		alucard.setAnimation( 'idle' );
	}
	
	private function killEnemy()
	{
		removeChild( enemy );
		enemy = null;
		generateEnemy();
	}
	
	private function generateEnemy()
	{
		
		var rand:UInt = (Math.floor(Math.random() * 5) + 1);
		
		switch( rand )
		{
			case 1:
				enemy = new Bat();
				enemy.y = 200;
			case 2:
				enemy = new Skull();
				enemy.y = 200;
			case 3:
				enemy = new Nymph();
				enemy.y = 210;
			case 4:
				enemy = new Succubus();
				enemy.y = 10;
			default:
				enemy = new Skeleton();
				enemy.y = 220;
		}

		enemy.x = stage.stageWidth + 10;
		addChildAt( enemy, 2 );
	}
	
}