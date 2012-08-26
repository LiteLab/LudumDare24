package org.ll.objects {
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	public class BotParticle extends FlxParticle {
		
		public var _type:int;
		
		// 1 is red.
		// 2 is purple.
		// 3 is dark green.
		// 4 is light green.
		
		public function BotParticle(type:int, X:Number, Y:Number) {
			this.x = X;
			this.y = Y;
			if (type == 1) {
				this.loadGraphic(AssetDirectory.ImgBotGibs, true, true, 4, 4, false);
				this.addAnimation("Red", ["0"], 0, false);
				this.play("Red");
			}
			if (type == 2) {
				this.loadGraphic(AssetDirectory.ImgBotGibs, true, true, 4, 4, false);
				this.addAnimation("Purple", ["1"], 0, false);
				this.play("Purple");
			}
			if (type == 3) {
				this.loadGraphic(AssetDirectory.ImgBotGibs, true, true, 4, 4, false);
				this.addAnimation("DarkGreen", ["2"], 0, false);
				this.play("DarkGreen");
			}
			if (type == 4) {
				this.loadGraphic(AssetDirectory.ImgBotGibs, true, true, 4, 4, false);
				this.addAnimation("LightGreen", ["3"], 0, false);
				this.play("LightGreen");
			}
			
			this.elasticity = 0.3;
			var _randomNum:Number = Global.randomNumBetween(1,4);
			
			if (_randomNum == 1) {
				this.facing = RIGHT;
			}
			
			if (_randomNum == 2) {
				this.facing = LEFT;
			}
			
			if (_randomNum == 3) {
				this.facing = UP;
			}
			
			if (_randomNum == 4) {
				this.facing = DOWN;
			}
		}
		
		override public function update():void {
			
			super.update();
		}
	}
}