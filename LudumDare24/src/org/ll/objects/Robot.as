package org.ll.objects {
	
	import org.flixel.*;
	import org.flixel.FlxG;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	/*
	*
	* This is the robot object. The little guy you control basically.
	*
	*/
	
	public class Robot extends FlxSprite {
		
		public var _exp:Number = 0;
		public var _level:Number = 0;
		
		public var _jumpPower:Number = 0.50;
		public var _runSpeed:int = 100;
		
		public var _bulletGroup:BulletGroup = new BulletGroup();
		
		public var _fireCount:int;
		
		public var _isShooting:Boolean;
		public var _isOnGround:Boolean;
		
		// 1 is LEFT.
		// 2 is RIGHT.
		public var _isMovingToThe:int = 2;
		public var _isTouchingGround:Boolean = false;
		
		public var _form:int = 1;
		
		
		
		public function Robot(X:Number, Y:Number) {
			super(X,Y);
			this.health = 100;
			this.loadGraphic(AssetDirectory.ImgPlayerv1, true, true, 14, 12, false);
			this.addAnimation("Idle", ["0"], 0, false);
			this.play("Idle");
			this.facing = RIGHT;
			this.maxVelocity.x = _runSpeed;			
			this.acceleration.x = 5;
			this.elasticity = 0.3;
			acceleration.y = 400;			
			this.drag.x = maxVelocity.x*4;
		}
		
		override public function update():void {
			acceleration.x = 0;
			
			this.maxVelocity.x = _runSpeed;
			
			if (_level == 5) {
				_level += 1;
				this.loadGraphic(AssetDirectory.ImgPlayerv2, true, true, 16, 12, false);
				this.addAnimation("Idle", ["0"], 0, false);
				this.play("Idle");
			}
			
			if (_level == 10) {
				_level += 1;
				_form = 2;
				this.loadGraphic(AssetDirectory.ImgPlayerv3, true, true, 16, 12, false);
				this.addAnimation("Idle", ["0"], 0, false);
				this.play("Idle");
			}
			
			if (_level == 30) {
				_level += 1;
				_form = 3;
				this.loadGraphic(AssetDirectory.ImgPlayerv4, true, true, 16, 12, false);
				this.addAnimation("Idle", ["0"], 0, false);
				this.play("Idle");
			}
			
			
			if (FlxG.keys.A || FlxG.keys.LEFT) {
				_isMovingToThe = 1;
				this.facing = LEFT;
				// move left.
				acceleration.x -= drag.x;
			}
			
			if (FlxG.keys.D || FlxG.keys.RIGHT) {
				_isMovingToThe = 2;
				this.facing = RIGHT;
				//move right.
				acceleration.x += drag.x;
			}
			
			if (FlxG.keys.justPressed("UP") && _isOnGround && isTouching(FLOOR)) {
				//jump.
				
				var randomJumpSnd:Number = Global.randomNumBetween(1, 4);
				
				if (randomJumpSnd == 1) {
					FlxG.play(AssetDirectory.SndJump1);
				}
				
				if (randomJumpSnd == 2) {
					FlxG.play(AssetDirectory.SndJump2);
				}
				
				if (randomJumpSnd == 3) {
					FlxG.play(AssetDirectory.SndJump3);
				}
				
				if (randomJumpSnd == 4) {
					FlxG.play(AssetDirectory.SndJump4);
				}
				
				velocity.y = -acceleration.y*0.51;
				_isOnGround = false;
			}
			
			if (FlxG.keys.justPressed("W") && _isOnGround && isTouching(FLOOR)) {
				//jump.
				
				var randomJumpWSnd:Number = Global.randomNumBetween(1, 4);
				
				if (randomJumpWSnd == 1) {
					FlxG.play(AssetDirectory.SndJump1);
				}
				
				if (randomJumpWSnd == 2) {
					FlxG.play(AssetDirectory.SndJump2);
				}
				
				if (randomJumpWSnd == 3) {
					FlxG.play(AssetDirectory.SndJump3);
				}
				
				if (randomJumpWSnd == 4) {
					FlxG.play(AssetDirectory.SndJump4);
				}
				
				velocity.y = -acceleration.y*_jumpPower;
				_isOnGround = false;
			}
			
			if (isTouching(FLOOR)) {
				_isOnGround = true;
			}
			
			if (justTouched(FLOOR)) {
				var randomLandSnd:Number = Global.randomNumBetween(1, 4);
				
				if (randomLandSnd == 1) {
					FlxG.play(AssetDirectory.SndLand1);
				}
				
				if (randomLandSnd == 2) {
					FlxG.play(AssetDirectory.SndLand2);
				}
				
				if (randomLandSnd == 3) {
					FlxG.play(AssetDirectory.SndLand3);
				}
				
				if (randomLandSnd == 4) {
					FlxG.play(AssetDirectory.SndLand4);
				}
			}
			
			if (FlxG.keys.justPressed("SPACE") || FlxG.mouse.justPressed()) {
				_isShooting == true;
				
				
				
				if (_form == 1) {
					
					var randomShootSound:Number = Global.randomNumBetween(1, 4);
					
					if (randomShootSound == 1) {
						FlxG.play(AssetDirectory.SndShoot1);
					}
					
					if (randomShootSound == 2) {
						FlxG.play(AssetDirectory.SndShoot2);
					}
					
					if (randomShootSound == 3) {
						FlxG.play(AssetDirectory.SndShoot3);
					}
					
					if (randomShootSound == 4) {
						FlxG.play(AssetDirectory.SndShoot4);
					}
					
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
				}
				
				if (_form == 2) {
					
					var randomShootv2Sound:Number = Global.randomNumBetween(1, 4);
					
					if (randomShootv2Sound == 1) {
						FlxG.play(AssetDirectory.SndShoot1);
						FlxG.play(AssetDirectory.SndShoot4, 0.5);
					}
					
					if (randomShootv2Sound == 2) {
						FlxG.play(AssetDirectory.SndShoot2);
						FlxG.play(AssetDirectory.SndShoot3, 0.5);
					}
					
					if (randomShootv2Sound == 3) {
						FlxG.play(AssetDirectory.SndShoot3);
						FlxG.play(AssetDirectory.SndShoot2, 0.5);
					}
					
					if (randomShootv2Sound == 4) {
						FlxG.play(AssetDirectory.SndShoot4);
						FlxG.play(AssetDirectory.SndShoot1, 0.5);
					}
					
					if (_isMovingToThe == 1) {
						this.x += 0.5;
						_bulletGroup.addNewBullet(this.x + 5, this.y + 1, 1, 1);
						_bulletGroup.addNewBullet(this.x + 5, this.y + 7, 1, 1);
						//_fireCount = 0;
					}
					
					if (_isMovingToThe == 2) {
						this.x -= 0.5;
						_bulletGroup.addNewBullet(this.x + 5, this.y + 1, 1, 2);
						_bulletGroup.addNewBullet(this.x + 5, this.y + 7, 1, 2);
						//_fireCount = 0;
					}
				}
				
				if (_form == 3) {
					
					var randomShootv3Sound:Number = Global.randomNumBetween(1, 4);
					
					if (randomShootv3Sound == 1) {
						FlxG.play(AssetDirectory.LastShoot1);
					}
					
					if (randomShootv3Sound == 2) {
						FlxG.play(AssetDirectory.LastShoot2);
					}
					
					if (randomShootv3Sound == 3) {
						FlxG.play(AssetDirectory.LastShoot3);
					}
					
					if (randomShootv3Sound == 4) {
						FlxG.play(AssetDirectory.LastShoot4);
					}
					
					if (_isMovingToThe == 1) {
						this.x += 0.5;
						_bulletGroup.addNewBullet(this.x + 5, this.y + 1, 2, 1);
						//_fireCount = 0;
					}
					
					if (_isMovingToThe == 2) {
						this.x -= 0.5;
						_bulletGroup.addNewBullet(this.x + 5, this.y + 1, 2, 2);
						//_fireCount = 0;
					}
				}
				
				
				// Shoot.
			}
			
			
			
			FlxG.log(_form);
			
			
			if (!_isShooting) {
				this.play("Idle");
			}
			
			if (isTouching(DOWN)) {
				_isTouchingGround = true;
			} else {
				_isTouchingGround = false;
			}
			
			if (FlxG.keys.justPressed("M")) {
				//hurtHP(5);
				awardExp(5);
			}
			
			
			super.update();
		}
		
		public function hurtHP(by:Number):void {
			
			var randomHitSound:Number = Global.randomNumBetween(1, 2);
			
			if (randomHitSound == 1) {
				FlxG.play(AssetDirectory.SndHit1);
			}
			
			if (randomHitSound == 2) {
				FlxG.play(AssetDirectory.SndHit2);
			}
			
			if (this.alive) {
				this.flicker(0.3);
				this.hurt(by);
			}
			
		}
		
		public function awardExp(by:Number):void {
			_exp += by;
			
			
			
			if (_exp >= 100) {
				_exp = 0;
				this._level += 1;
				
				var randomNum:Number = Global.randomNumBetween(1, 4);
				
				if (randomNum == 1) {
					_runSpeed += 2;
				}
				
				if (randomNum == 2) {
					_jumpPower += 0.03;
				}
				
				if (randomNum == 3) {
					health += 2;
				}
				
				if (randomNum == 4) {
					Global._currentDamage += 2;
				}
			}
		}
	}
}