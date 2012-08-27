package org.ll.objects {
	
	import com.eclecticdesignstudio.motion.Actuate;
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	public class Mob extends FlxSprite {
		
		public var _isBoss:Boolean;
		public var _emitter:FlxEmitter;
		public static var _type:int;
		
		public var _isMovingTo:int;
		public var _isMoving:Boolean;
		public var _isOnGround:Boolean;
		
		private var _hasEmitted:Boolean;
		
		public function Mob(X:Number, Y:Number) {
			super(X,Y);
			
			this.health = 30;
			this.maxVelocity.x = 100;			
			this.acceleration.x = 5;
			this.elasticity = 0.3;
			acceleration.y = 400;			
			this.drag.x = maxVelocity.x*4;
			
			// You only have a 2 out of 8 chance that you'll get a boss, might be tweaked later
			// though.
			
			var _randomNum:Number = Global.randomNumBetween(1, 14);
			
			if (_randomNum == 1 ) {
				this.loadGraphic(AssetDirectory.ImgMob1, true, true, 8, 8, false);
				addAnimation("Idle0", ["0"], 0, false);
				play("Idle0");
				_type = 1;
			}
			
			if (_randomNum == 2) {
				this.loadGraphic(AssetDirectory.ImgMob1, true, true, 8, 8, false);
				addAnimation("Idle1", ["1"], 0, false);
				play("Idle1");
				_type = 2;
			}
			
			if (_randomNum == 3) {
				this.loadGraphic(AssetDirectory.ImgMob1, true, true, 8, 8, false);
				addAnimation("Idle2", ["2"], 0, false);
				play("Idle2");
				_type = 3;
			}
			
			if (_randomNum == 4) {
				this.loadGraphic(AssetDirectory.ImgMob2, true, true, 8, 12, false);
				addAnimation("Idle3", ["0"], 0, false);
				play("Idle3");
				_type = 1;
			}
			
			if (_randomNum == 5) {
				this.loadGraphic(AssetDirectory.ImgMob2, true, true, 8, 12, false);
				addAnimation("Idle4", ["1"], 0, false);
				play("Idle4");
				_type = 2;
			}
			
			if (_randomNum == 6) {
				this.loadGraphic(AssetDirectory.ImgMob2, true, true, 8, 12, false);
				addAnimation("Idle5", ["2"], 0, false);
				play("Idle5");
				_type = 3;
			}
			
			// SECOND.
			if (_randomNum == 7 ) {
				this.loadGraphic(AssetDirectory.ImgMob1, true, true, 8, 8, false);
				addAnimation("Idle0", ["0"], 0, false);
				play("Idle0");
				_type = 1;
			}
			
			if (_randomNum == 8) {
				this.loadGraphic(AssetDirectory.ImgMob1, true, true, 8, 8, false);
				addAnimation("Idle1", ["1"], 0, false);
				play("Idle1");
				_type = 2;
			}
			
			if (_randomNum == 9) {
				this.loadGraphic(AssetDirectory.ImgMob1, true, true, 8, 8, false);
				addAnimation("Idle2", ["2"], 0, false);
				play("Idle2");
				_type = 3;
			}
			
			if (_randomNum == 10) {
				this.loadGraphic(AssetDirectory.ImgMob2, true, true, 8, 12, false);
				addAnimation("Idle3", ["0"], 0, false);
				play("Idle3");
				_type = 1;
			}
			
			if (_randomNum == 11) {
				this.loadGraphic(AssetDirectory.ImgMob2, true, true, 8, 12, false);
				addAnimation("Idle4", ["1"], 0, false);
				play("Idle4");
				_type = 2;
			}
			
			if (_randomNum == 12) {
				this.loadGraphic(AssetDirectory.ImgMob2, true, true, 8, 12, false);
				addAnimation("Idle5", ["2"], 0, false);
				play("Idle5");
				_type = 3;
			}
			
			
			// BOSS
			
			if (_randomNum == 13 && !Global._isBossOut) {
				this.loadGraphic(AssetDirectory.ImgBoss1, false, true, 32, 32, false);
				_isBoss = true;
				_type = 4;
				Global._isBossOut = true;
				
			} else if (_randomNum == 13) {
				this.kill();
			}
			
			if (_randomNum == 14 && !Global._isBossOut) {
				this.loadGraphic(AssetDirectory.ImgBoss2, false, true, 32, 48, false);
				_isBoss = true;
				_type = 5;
				Global._isBossOut = true;
			} else if (_randomNum == 14) {
				this.kill();
			}
			
			if (_isBoss) {
				this.health = 300;
			}
			
			if (_isBoss && Global._playerBot._level == 10) {
				this.health = 400;
			}
			
			if (_isBoss && Global._playerBot._level == 30) {
				this.health = 650;
			}
			
			if (_isBoss && Global._playerBot._level >= 40) {
				this.health = 1000;
			}
			
			//if (_type == 1) {
			_emitter = new FlxEmitter(0,0,5);
			_emitter.makeParticles(AssetDirectory.ImgGibs1, 5, 16, false, 0.8); 
			//}
			
			FlxG.log(_type.toString() + ", HP: " + this.health.toString());
			
			
			
			
			this.alpha = 0;
			Actuate.tween(this, 1, {alpha:1});
		}
		
		public function hurtHP(by:Number):void {
			
			var randomHitSound:Number = Global.randomNumBetween(1, 4);
			
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
			
			if (this.health <= 0) {
				
				if (_isBoss) {
					Global._isBossOut = false;
				}
				
				if (!_isBoss) {
					Global._enemyKills += 1;
				}
				
				if (_isBoss) {
					Global._bossKills += 1;
				}
			}
		}
		
		override public function update():void {
			acceleration.x = 0;
			
			_emitter.at(this);
			
			// Here lies the AI code, note:
			// IT'S VERY RANDOM.
			// I wouldn't quite consider it intelligence in the first place.
			
			if (_isMovingTo == 1 && _isMoving) {
				acceleration.x -= drag.x;
				this.facing = LEFT;
			}
			
			if (_isMovingTo == 2 && _isMoving) {
				acceleration.x += drag.x;
				this.facing = RIGHT;
			}
			
			if (isTouching(WALL)) {
				var _randomJumpNum:Number = Global.randomNumBetween(1,4);
				
				if (_randomJumpNum == 2) {
					jump();
				}
				
			}
			
			if (justTouched(FLOOR) && _isBoss) {
				FlxG.shake(0.02, 0.2);
				var randomBossLandSnd:Number = Global.randomNumBetween(1, 10);
				
				if (randomBossLandSnd == 1) {
					FlxG.play(AssetDirectory.SndBossLand1);
				}
				
				if (randomBossLandSnd == 2) {
					FlxG.play(AssetDirectory.SndBossLand2);
				}
				
				if (randomBossLandSnd == 3) {
					FlxG.play(AssetDirectory.SndBossLand3);
				}
				
				if (randomBossLandSnd == 4) {
					FlxG.play(AssetDirectory.SndBossLand4);
				}
			}
			
			if (justTouched(FLOOR) && !_isBoss) {
				_isOnGround = true;
				var randomLandSnd:Number = Global.randomNumBetween(1, 8);
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
			
			if (isTouching(FLOOR)) {
				_isOnGround = true;
				
			}
			
			var _randomNum:Number = Global.randomNumBetween(1,8);
			
			if (_randomNum == 2) {
				_isMovingTo = 1;
				_isMoving = true;
			}
			
			if (_randomNum == 8) {
				_isMovingTo = 2;
				_isMoving = true;
			}
			
			
			super.update();
		}
		
		public function jump():void {
			if (_isOnGround) {
				//jump.
				velocity.y = -acceleration.y*0.51;
				_isOnGround = false;
			}
		}
	}
}