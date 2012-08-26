package org.ll.states {
	
	import org.flixel.*;
	
	import org.ll.assets.AssetDirectory;
	
	public class AboutState extends FlxState {
		override public function create():void {
			FlxG.flash(0xff000000,1);
			var msg:FlxSprite = new FlxSprite(3, 5);
			msg.loadGraphic(AssetDirectory.ImgAboutMsg,false,false, 384, 141);
			add(msg);
		}
		
		override public function update():void {
			super.update();
			if (FlxG.keys.justPressed("SPACE")) {
				FlxG.fade(0xff000000, 1, backToMenu);
			}
		}
		
		public function backToMenu():void {
			FlxG.switchState(new MenuState);
		}
	}
}