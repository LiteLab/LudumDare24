package org.ll.states {
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	public class GameOverState extends FlxState {
		
		public var _stats:FlxText = new FlxText(150, 220, 200);
		public var _back:FlxText = new FlxText(150, 240, 200, "Press Space to go to the menu.");
		
		override public function create():void {
			FlxG.flash(0xff000000, 1);
			FlxG.bgColor = 0xff000000;
			var gameover:FlxSprite = new FlxSprite(172, 182,null);
			gameover.loadGraphic(AssetDirectory.ImgGameOver, false, false, 168, 20, false);
			add(gameover);
			add(_stats);
			add(_back);
			_stats.alignment = "center";
			_back.alignment = "center";
			
			_stats.text = "Bot Kills: " + Global._enemyKills.toString() + ", Boss Kills: " + Global._bossKills.toString() + ".";
			
			//Press Space to go to the menu."
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.keys.justPressed("SPACE")) {
				FlxG.fade(0xff000000, 1, whenFadeIsDone);
			}
			
		}
		
		public function whenFadeIsDone():void {
			FlxG.switchState(new MenuState);
		}
	}
}