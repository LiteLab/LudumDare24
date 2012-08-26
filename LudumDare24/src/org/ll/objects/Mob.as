package org.ll.objects {
	
	import com.eclecticdesignstudio.motion.Actuate;
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	public class Mob extends FlxSprite {
		
		public var _isBoss:Boolean;
		public var _emitter:FlxEmitter = new FlxEmitter(0,0, 20);
		public static var _type:int;
		
		private var _hasEmitted:Boolean;
		
		public function Mob(X:Number, Y:Number) {
			super(X,Y);
			
			this.health = 100;
			this.maxVelocity.x = 100;			
			this.acceleration.x = 5;
			this.elasticity = 0.3;
			// acceleration.y = 400;			
			this.drag.x = maxVelocity.x*4;
			
			// You only have a 2 out of 8 chance that you'll get a boss, might be tweaked later
			// though.
			
			var _randomNum:Number = Global.randomNumBetween(1, 8);
			
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
			
			if (_randomNum == 7) {
				this.loadGraphic(AssetDirectory.ImgBoss1, false, true, 32, 32, false);
				_isBoss = true;
				_type = 4;
			}
			
			if (_randomNum == 8) {
				this.loadGraphic(AssetDirectory.ImgBoss2, false, true, 32, 48, false);
				_isBoss = true;
				_type = 5;
			}
			
			
			
			
			this.alpha = 0;
			Actuate.tween(this, 1, {alpha:1});
		}
		
		public function hurtHP(by:Number):void {
			if (this.alive) {
				this.flicker(0.3);
				this.hurt(by);
			}
		}
		
		override public function update():void {
			acceleration.x = 0;
			
			_emitter.x = this.x;
			_emitter.y = this.y;
			
			if (FlxG.keys.justPressed("U")) {
				hurtHP(50);
			}
			
			super.update();
		}
	}
}