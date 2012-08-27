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