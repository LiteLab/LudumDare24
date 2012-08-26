package org.ll.states {
	
	import com.eclecticdesignstudio.motion.Actuate;
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.objects.BotParticle;
	import org.ll.objects.Bullet;
	import org.ll.objects.BulletGroup;
	import org.ll.objects.Mob;
	import org.ll.objects.Robot;
	import org.ll.ui.HPBar;
	
	public class DebugState extends FlxState {
		
		public var _testMob:Mob = new Mob(150,100);
		public var _cameraDoll:FlxObject = new FlxObject();
		
		public var _testHP:HPBar = new HPBar();
		
		public var _enemyGroup:FlxGroup = new FlxGroup(0);
		
		public var _testParticle:BotParticle = new BotParticle(2, 100, 100);
		
		override public function create():void {
			add(Global._playerBot);
			add(Global._playerBot._bulletGroup);
			add(_cameraDoll);
			add(_enemyGroup);
			add(_testHP._grouped);
			
			//add(_testMob._emitter);
			//add(_testParticle);
			//FlxG.camera.follow(_cameraDoll);
			
		}
		
		public function onBulletEnemyHit(A:Mob, B:Bullet):void {
			if (B is Bullet) {
				A.hurtHP(10);
			}
		}
		
		override public function update():void {
			
			//Actuate.tween(_cameraDoll, 0.5, {x:_testBot.x, y:_testBot.y});
			
			FlxG.collide(_enemyGroup,Global._playerBot._bulletGroup,onBulletEnemyHit);
			
			if (FlxG.keys.justPressed("J")) {
				_enemyGroup.add(new Mob(Global.randomNumBetween(0,340), 100));
			}
			
			super.update();
		}
		
	}
}