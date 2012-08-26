package org.ll.states {
	
	import org.flixel.*;
	import org.ll.assets.AssetDirectory;
	
	public class GameOverState extends FlxState {
		
		public var _fadeTimer:FlxTimer = new FlxTimer();
		
		override public function create():void {
			FlxG.flash(0xff000000, 1);
			_fadeTimer.start(2, 1);
			var gameover:FlxSprite = new FlxSprite(172, 182,null);
			gameover.loadGraphic(AssetDirectory.ImgGameOver, false, false, 168, 20, false);
			add(gameover);
		}
		
		override public function update():void {
			super.update();
			
			if (_fadeTimer.finished) {
				FlxG.fade(0xff000000, 1, whenFadeIsDone);
			}
			
		}
		
		public function whenFadeIsDone():void {
			FlxG.switchState(new MenuState);
		}
	}
}