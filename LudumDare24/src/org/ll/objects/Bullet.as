package org.ll.objects {
	
	import org.flixel.*;
	import org.ll.assets.AssetDirectory;
	
	/*
	*
	* This is the class, or really, the bullet object. It moves at a rapid speed and kills enemies basically.
	*
	*/
	
	public class Bullet extends FlxSprite {
		
		public var _type:int;
		public var _direction:int;
		
		// 1 is norm.
		// 2 is giant.
		
		// 1 IS LEFT.
		// 2 IS RIGHT.
		public function Bullet(X:Number, Y:Number, Type:int, Direction:int) {
			super(X,Y);
			if (Type == 2) {
				_type == 2;
				this.loadGraphic(AssetDirectory.ImgGiantBullet, false, true, 9, 9, false);
			} else {
				_type == 1;
				this.loadGraphic(AssetDirectory.ImgBullet, false, true, 5, 3, false);
			}
			
			if (Direction == 1) {
				_direction = 1;
				this.facing = LEFT;
			} else if (Direction == 2) {
				_direction = 2;
				this.facing = RIGHT;
			}
		}
		
		override public function update():void {
			acceleration.x = 0;
			if (_direction == 1) {
				this.x -= 10;
			}
			if (_direction == 2) {
				this.x += 10;
			}
			super.update();
		}
	}
}