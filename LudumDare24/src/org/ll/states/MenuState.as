package org.ll.states {
	
	import com.eclecticdesignstudio.motion.Actuate;
	
	import org.flixel.*;
	import org.ll.assets.AssetDirectory;
	
	public class MenuState extends FlxState {
		
		public var _SRE:FlxSprite = new FlxSprite(0,0,null);
		public var _playTxt:FlxSprite = new FlxSprite(0,0, null);
		public var _aboutTxt:FlxSprite = new FlxSprite(0,0, null);
		
		public var _cursor:FlxSprite = new FlxSprite(0,0,null);
		public var _cursorSpot:int = 1;
		
		override public function create():void {
			FlxG.flash(0x000000, 1);
			
			_cursor.loadGraphic(AssetDirectory.ImgBotCursor, false, false, 10, 10, false);
			_cursor.x = 218;
			_cursor.y = 187;
			_cursor.alpha = 0;
			
			_SRE.loadGraphic(AssetDirectory.ImgSRE, false, false, 162, 41, false);
			_SRE.x = 175;
			_SRE.y = -100;
			
			_playTxt.loadGraphic(AssetDirectory.ImgPlay, false, false, 36, 10, false);
			_playTxt.alpha = 0;
			_playTxt.x = 238;
			_playTxt.y = 187;
			
			_aboutTxt.loadGraphic(AssetDirectory.ImgAbout, false, false, 46, 10, false);
			_aboutTxt.alpha = 0;
			_aboutTxt.x = 233;
			_aboutTxt.y = 227;
			
			add(_SRE);
			add(_playTxt);
			add(_cursor);
			add(_aboutTxt);
			
			Actuate.tween(_SRE, 2, {y:30});
			Actuate.tween(_playTxt, 3, {alpha:1});
			Actuate.tween(_aboutTxt, 3, {alpha:1});
			Actuate.tween(_cursor, 3, {alpha:1});
		}
		
		
		
		override public function update():void {
			
			if (FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W")) {
				_cursorSpot = 1;
				_cursor.x = 218;
				_cursor.y = 187;
			}
			
			if (FlxG.keys.justPressed("DOWN") || FlxG.keys.justPressed("S")) {
				_cursorSpot = 2;
				_cursor.x = 213;
				_cursor.y = 227;
			}
			
			if (FlxG.keys.justPressed("SPACE") && _cursorSpot == 2) {
				FlxG.fade(0xff000000, 1, fadeSwitchAbout);
				
			}
			
			
			super.update();
		}
		
		public function fadeSwitchAbout():void {
			FlxG.switchState(new AboutState);
		}
	}
}