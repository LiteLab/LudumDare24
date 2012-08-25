package org.ll.objects {
	
	import org.flixel.*;
	import org.flixel.FlxG;
	import org.ll.assets.AssetDirectory;
	
	/*
	*
	* This is the robot object. The little guy you control basically.
	*
	*/
	
	public class Robot extends FlxSprite {
		
		public var _healthPoints:int = 100;
		public var _exp:int = 0;
		public var _jumpPower:int;
		
		public var _bulletGroup:BulletGroup = new BulletGroup();
		
		public var _fireCount:int;
		
		public var _isShooting:Boolean;
		
		// 1 is LEFT.
		// 2 is RIGHT.
		public var _isMovingToThe:int = 2;
		public var _isTouchingGround:Boolean = false;
		
		public function Robot(X:Number, Y:Number) {
			super(X,Y);
			this.loadGraphic(AssetDirectory.ImgPlayer, true, true, 15, 12, false);
			this.addAnimation("Idle", ["0"], 0, false);
			this.addAnimation("Shoot", ["0", "1", "2", "0"], 8, true);
			this.play("Idle");
			this.facing = RIGHT;
			this.maxVelocity.x = 100;			
			this.acceleration.x = 5;
			this.elasticity = 0.3;
			// acceleration.y = 400;			
			this.drag.x = maxVelocity.x*4;
		}
		
		override public function update():void {
			acceleration.x = 0;
			
			if (FlxG.keys.A) {
				_isMovingToThe = 1;
				this.facing = LEFT;
				// move left.
				acceleration.x -= drag.x;
			}
			
			if (FlxG.keys.D) {
				_isMovingToThe = 2;
				this.facing = RIGHT;
				//move right.
				acceleration.x += drag.x;
			}
			
			if (FlxG.keys.W) {
				//jump.
			}
			
			if (FlxG.keys.justPressed("SPACE")) {
				_isShooting == true;
				
				if (_isMovingToThe == 1) {
					this.x += 0.5;
					_bulletGroup.addNewBullet(this.x + 5, this.y + 4, 1, 1);
					//_fireCount = 0;
				}
				
				if (_isMovingToThe == 2) {
					this.x -= 0.5;
					_bulletGroup.addNewBullet(this.x + 5, this.y + 4, 1, 2);
					//_fireCount = 0;
				}
				
				// Shoot.
			}
			
			
			if (!_isShooting) {
				this.play("Idle");
			}
			
			if (isTouching(DOWN)) {
				_isTouchingGround = true;
			} else {
				_isTouchingGround = false;
			}
			
			
			super.update();
		}
	}
}