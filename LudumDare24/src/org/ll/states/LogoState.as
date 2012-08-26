package org.ll.states {
	
	import com.eclecticdesignstudio.motion.Actuate;
	import com.eclecticdesignstudio.motion.easing.Elastic;
	
	import org.flixel.*;
	import org.ll.assets.AssetDirectory;
	import org.ll.states.*;
	
	public class LogoState extends FlxState {
		
		public var _logo:FlxSprite = new FlxSprite(127, -75, AssetDirectory.ImgLogo);
		public var _fadeTimer:FlxTimer = new FlxTimer();
		
		override public function create():void {
			FlxG.flash(0xff000000, 1);
			_fadeTimer.start(1.5, 1);
			add(_logo);
			Actuate.tween(_logo, 1, { y:156 } ).ease (Elastic.easeOut);
		}
		
		public function whenFadeIsDone():void {
			FlxG.switchState(new MenuState);
		}
		
		override public function update():void {
			
			if (_fadeTimer.finished) {
				FlxG.fade(0xff000000, 1, whenFadeIsDone);
			}
			
			super.update();
		}
		
	}
}