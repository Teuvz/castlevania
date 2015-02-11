package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("img/15215.png", __ASSET__img_15215_png);
		type.set ("img/15215.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/24903.png", __ASSET__img_24903_png);
		type.set ("img/24903.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/3228.png", __ASSET__img_3228_png);
		type.set ("img/3228.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/3436.png", __ASSET__img_3436_png);
		type.set ("img/3436.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/3449.png", __ASSET__img_3449_png);
		type.set ("img/3449.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/3697.png", __ASSET__img_3697_png);
		type.set ("img/3697.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/3888.png", __ASSET__img_3888_png);
		type.set ("img/3888.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/3923.png", __ASSET__img_3923_png);
		type.set ("img/3923.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/4258.png", __ASSET__img_4258_png);
		type.set ("img/4258.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/4265.png", __ASSET__img_4265_png);
		type.set ("img/4265.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/backdrop.png", __ASSET__img_backdrop_png);
		type.set ("img/backdrop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/spritesheet-npc.png", __ASSET__img_spritesheet_npc_png);
		type.set ("img/spritesheet-npc.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("img/spritesheet.png", __ASSET__img_spritesheet_png);
		type.set ("img/spritesheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("music/music.mp3", __ASSET__music_music_mp3);
		type.set ("music/music.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("snd/hit-alucard.wav", __ASSET__snd_hit_alucard_wav);
		type.set ("snd/hit-alucard.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("snd/hit-bat.wav", __ASSET__snd_hit_bat_wav);
		type.set ("snd/hit-bat.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("snd/hit-skull.wav", __ASSET__snd_hit_skull_wav);
		type.set ("snd/hit-skull.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("snd/hit1.wav", __ASSET__snd_hit1_wav);
		type.set ("snd/hit1.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("snd/hit2.wav", __ASSET__snd_hit2_wav);
		type.set ("snd/hit2.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("img/15215.png", "img/15215.png");
		type.set ("img/15215.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/24903.png", "img/24903.png");
		type.set ("img/24903.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/3228.png", "img/3228.png");
		type.set ("img/3228.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/3436.png", "img/3436.png");
		type.set ("img/3436.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/3449.png", "img/3449.png");
		type.set ("img/3449.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/3697.png", "img/3697.png");
		type.set ("img/3697.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/3888.png", "img/3888.png");
		type.set ("img/3888.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/3923.png", "img/3923.png");
		type.set ("img/3923.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/4258.png", "img/4258.png");
		type.set ("img/4258.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/4265.png", "img/4265.png");
		type.set ("img/4265.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/backdrop.png", "img/backdrop.png");
		type.set ("img/backdrop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/spritesheet-npc.png", "img/spritesheet-npc.png");
		type.set ("img/spritesheet-npc.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("img/spritesheet.png", "img/spritesheet.png");
		type.set ("img/spritesheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("music/music.mp3", "music/music.mp3");
		type.set ("music/music.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("snd/hit-alucard.wav", "snd/hit-alucard.wav");
		type.set ("snd/hit-alucard.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("snd/hit-bat.wav", "snd/hit-bat.wav");
		type.set ("snd/hit-bat.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("snd/hit-skull.wav", "snd/hit-skull.wav");
		type.set ("snd/hit-skull.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("snd/hit1.wav", "snd/hit1.wav");
		type.set ("snd/hit1.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("snd/hit2.wav", "snd/hit2.wav");
		type.set ("snd/hit2.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__img_15215_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_24903_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_3228_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_3436_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_3449_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_3697_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_3888_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_3923_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_4258_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_4265_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_backdrop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_spritesheet_npc_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__img_spritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__music_music_mp3 extends flash.media.Sound { }
class __ASSET__snd_hit_alucard_wav extends flash.media.Sound { }
class __ASSET__snd_hit_bat_wav extends flash.media.Sound { }
class __ASSET__snd_hit_skull_wav extends flash.media.Sound { }
class __ASSET__snd_hit1_wav extends flash.media.Sound { }
class __ASSET__snd_hit2_wav extends flash.media.Sound { }


#elseif html5






















#end