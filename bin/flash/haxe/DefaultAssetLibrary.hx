package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("img/15215.png", __ASSET__img_15215_png);
		type.set ("img/15215.png", AssetType.IMAGE);
		className.set ("img/24903.png", __ASSET__img_24903_png);
		type.set ("img/24903.png", AssetType.IMAGE);
		className.set ("img/3228.png", __ASSET__img_3228_png);
		type.set ("img/3228.png", AssetType.IMAGE);
		className.set ("img/3436.png", __ASSET__img_3436_png);
		type.set ("img/3436.png", AssetType.IMAGE);
		className.set ("img/3449.png", __ASSET__img_3449_png);
		type.set ("img/3449.png", AssetType.IMAGE);
		className.set ("img/3697.png", __ASSET__img_3697_png);
		type.set ("img/3697.png", AssetType.IMAGE);
		className.set ("img/3888.png", __ASSET__img_3888_png);
		type.set ("img/3888.png", AssetType.IMAGE);
		className.set ("img/3923.png", __ASSET__img_3923_png);
		type.set ("img/3923.png", AssetType.IMAGE);
		className.set ("img/4258.png", __ASSET__img_4258_png);
		type.set ("img/4258.png", AssetType.IMAGE);
		className.set ("img/4265.png", __ASSET__img_4265_png);
		type.set ("img/4265.png", AssetType.IMAGE);
		className.set ("img/backdrop.png", __ASSET__img_backdrop_png);
		type.set ("img/backdrop.png", AssetType.IMAGE);
		className.set ("img/spritesheet-npc.png", __ASSET__img_spritesheet_npc_png);
		type.set ("img/spritesheet-npc.png", AssetType.IMAGE);
		className.set ("img/spritesheet.png", __ASSET__img_spritesheet_png);
		type.set ("img/spritesheet.png", AssetType.IMAGE);
		className.set ("music/music.mp3", __ASSET__music_music_mp3);
		type.set ("music/music.mp3", AssetType.MUSIC);
		className.set ("snd/hit-alucard.wav", __ASSET__snd_hit_alucard_wav);
		type.set ("snd/hit-alucard.wav", AssetType.SOUND);
		className.set ("snd/hit-bat.wav", __ASSET__snd_hit_bat_wav);
		type.set ("snd/hit-bat.wav", AssetType.SOUND);
		className.set ("snd/hit-skull.wav", __ASSET__snd_hit_skull_wav);
		type.set ("snd/hit-skull.wav", AssetType.SOUND);
		className.set ("snd/hit1.wav", __ASSET__snd_hit1_wav);
		type.set ("snd/hit1.wav", AssetType.SOUND);
		className.set ("snd/hit2.wav", __ASSET__snd_hit2_wav);
		type.set ("snd/hit2.wav", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "img/15215.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/24903.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/3228.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/3436.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/3449.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/3697.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/3888.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/3923.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/4258.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/4265.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/backdrop.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/spritesheet-npc.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/spritesheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "music/music.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "snd/hit-alucard.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "snd/hit-bat.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "snd/hit-skull.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "snd/hit1.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "snd/hit2.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/15215.png", __ASSET__img_15215_png);
		type.set ("img/15215.png", AssetType.IMAGE);
		
		className.set ("img/24903.png", __ASSET__img_24903_png);
		type.set ("img/24903.png", AssetType.IMAGE);
		
		className.set ("img/3228.png", __ASSET__img_3228_png);
		type.set ("img/3228.png", AssetType.IMAGE);
		
		className.set ("img/3436.png", __ASSET__img_3436_png);
		type.set ("img/3436.png", AssetType.IMAGE);
		
		className.set ("img/3449.png", __ASSET__img_3449_png);
		type.set ("img/3449.png", AssetType.IMAGE);
		
		className.set ("img/3697.png", __ASSET__img_3697_png);
		type.set ("img/3697.png", AssetType.IMAGE);
		
		className.set ("img/3888.png", __ASSET__img_3888_png);
		type.set ("img/3888.png", AssetType.IMAGE);
		
		className.set ("img/3923.png", __ASSET__img_3923_png);
		type.set ("img/3923.png", AssetType.IMAGE);
		
		className.set ("img/4258.png", __ASSET__img_4258_png);
		type.set ("img/4258.png", AssetType.IMAGE);
		
		className.set ("img/4265.png", __ASSET__img_4265_png);
		type.set ("img/4265.png", AssetType.IMAGE);
		
		className.set ("img/backdrop.png", __ASSET__img_backdrop_png);
		type.set ("img/backdrop.png", AssetType.IMAGE);
		
		className.set ("img/spritesheet-npc.png", __ASSET__img_spritesheet_npc_png);
		type.set ("img/spritesheet-npc.png", AssetType.IMAGE);
		
		className.set ("img/spritesheet.png", __ASSET__img_spritesheet_png);
		type.set ("img/spritesheet.png", AssetType.IMAGE);
		
		className.set ("music/music.mp3", __ASSET__music_music_mp3);
		type.set ("music/music.mp3", AssetType.MUSIC);
		
		className.set ("snd/hit-alucard.wav", __ASSET__snd_hit_alucard_wav);
		type.set ("snd/hit-alucard.wav", AssetType.SOUND);
		
		className.set ("snd/hit-bat.wav", __ASSET__snd_hit_bat_wav);
		type.set ("snd/hit-bat.wav", AssetType.SOUND);
		
		className.set ("snd/hit-skull.wav", __ASSET__snd_hit_skull_wav);
		type.set ("snd/hit-skull.wav", AssetType.SOUND);
		
		className.set ("snd/hit1.wav", __ASSET__snd_hit1_wav);
		type.set ("snd/hit1.wav", AssetType.SOUND);
		
		className.set ("snd/hit2.wav", __ASSET__snd_hit2_wav);
		type.set ("snd/hit2.wav", AssetType.SOUND);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
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
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
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
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
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
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
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
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
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
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
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
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
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
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__img_15215_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_24903_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_3228_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_3436_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_3449_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_3697_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_3888_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_3923_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_4258_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_4265_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_backdrop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_spritesheet_npc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_spritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__music_music_mp3 extends openfl.media.Sound { }
@:keep class __ASSET__snd_hit_alucard_wav extends openfl.media.Sound { }
@:keep class __ASSET__snd_hit_bat_wav extends openfl.media.Sound { }
@:keep class __ASSET__snd_hit_skull_wav extends openfl.media.Sound { }
@:keep class __ASSET__snd_hit1_wav extends openfl.media.Sound { }
@:keep class __ASSET__snd_hit2_wav extends openfl.media.Sound { }


#elseif html5






















#elseif (windows || mac || linux)


@:bitmap("assets/img/15215.png") class __ASSET__img_15215_png extends flash.display.BitmapData {}
@:bitmap("assets/img/24903.png") class __ASSET__img_24903_png extends flash.display.BitmapData {}
@:bitmap("assets/img/3228.png") class __ASSET__img_3228_png extends flash.display.BitmapData {}
@:bitmap("assets/img/3436.png") class __ASSET__img_3436_png extends flash.display.BitmapData {}
@:bitmap("assets/img/3449.png") class __ASSET__img_3449_png extends flash.display.BitmapData {}
@:bitmap("assets/img/3697.png") class __ASSET__img_3697_png extends flash.display.BitmapData {}
@:bitmap("assets/img/3888.png") class __ASSET__img_3888_png extends flash.display.BitmapData {}
@:bitmap("assets/img/3923.png") class __ASSET__img_3923_png extends flash.display.BitmapData {}
@:bitmap("assets/img/4258.png") class __ASSET__img_4258_png extends flash.display.BitmapData {}
@:bitmap("assets/img/4265.png") class __ASSET__img_4265_png extends flash.display.BitmapData {}
@:bitmap("assets/img/backdrop.png") class __ASSET__img_backdrop_png extends flash.display.BitmapData {}
@:bitmap("assets/img/spritesheet-npc.png") class __ASSET__img_spritesheet_npc_png extends flash.display.BitmapData {}
@:bitmap("assets/img/spritesheet.png") class __ASSET__img_spritesheet_png extends flash.display.BitmapData {}
@:sound("assets/music/music.mp3") class __ASSET__music_music_mp3 extends flash.media.Sound {}
@:sound("assets/sound/hit-alucard.wav") class __ASSET__snd_hit_alucard_wav extends flash.media.Sound {}
@:sound("assets/sound/hit-bat.wav") class __ASSET__snd_hit_bat_wav extends flash.media.Sound {}
@:sound("assets/sound/hit-skull.wav") class __ASSET__snd_hit_skull_wav extends flash.media.Sound {}
@:sound("assets/sound/hit1.wav") class __ASSET__snd_hit1_wav extends flash.media.Sound {}
@:sound("assets/sound/hit2.wav") class __ASSET__snd_hit2_wav extends flash.media.Sound {}


#end
