package org.ll.states {
	
	import com.eclecticdesignstudio.motion.Actuate;
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	import org.ll.objects.BotParticle;
	import org.ll.objects.Bullet;
	import org.ll.objects.BulletGroup;
	import org.ll.objects.Mob;
	import org.ll.objects.Robot;
	import org.ll.ui.HPBar;
	
	public class DebugState extends FlxState {
		
		public var _testMob:Mob = new Mob(150,100);
		public var _cameraDoll:FlxObject = new FlxObject();
		
		public var _tileMap:FlxTilemap = new FlxTilemap();
		
		public var _testHP:HPBar = new HPBar();
		
		public var _enemyGroup:FlxGroup = new FlxGroup(0);
		
		public var _testParticle:BotParticle = new BotParticle(2, 100, 100);
		
		public var _interval:int = 0;
		
		public var _rateOfEnemies:int = 60;
		
		public var _mapBG1:FlxSprite = new FlxSprite(-50,200);
		public var _mapBG2:FlxSprite = new FlxSprite(-80,180);
		public var _mapBG3:FlxSprite = new FlxSprite(-100,160);
		
		override public function create():void {
			FlxG.bgColor = 0xff8CD1FF;
			FlxG.flash(0xff000000, 1);
			
			_mapBG1.loadGraphic(AssetDirectory.MapBG1, false, false, 1714, 197);
			_mapBG1.scrollFactor.x = 0.5;
			_mapBG2.loadGraphic(AssetDirectory.MapBG2, false, false, 1714, 197);
			_mapBG2.scrollFactor.x = 0.3;
			_mapBG3.loadGraphic(AssetDirectory.MapBG3, false, false, 1714, 197);
			_mapBG3.scrollFactor.x = 0.1;
			
			var _randomMapNum:Number = Global.randomNumBetween(1,3);
			
			if ( _randomMapNum == 1) {
				_tileMap.loadMap(new AssetDirectory.Mp1, AssetDirectory.ImgTileMap, 16, 16);
			}
			
			if ( _randomMapNum == 2) {
				_tileMap.loadMap(new AssetDirectory.Mp2, AssetDirectory.ImgTileMap, 16, 16);
			}
			
			if ( _randomMapNum == 3) {
				_tileMap.loadMap(new AssetDirectory.Mp3, AssetDirectory.ImgTileMap, 16, 16);
			}
			
			FlxG.worldBounds.make(0, 0, _tileMap.width, _tileMap.height);
			FlxG.camera.setBounds(0, 0, _tileMap.width, _tileMap.height);
			FlxG.camera.follow(Global._playerBot);
			
			add(_mapBG3);
			add(_mapBG2);
			add(_mapBG1);
			add(Global._playerBot);
			add(Global._playerBot._bulletGroup);
			add(_cameraDoll);
			add(_enemyGroup);
			add(_testHP._grouped);
			add(_tileMap);
			
			//add(_testMob._emitter);
			//add(_testParticle);
			//FlxG.camera.follow(_cameraDoll);
			
		}
		
		public function onBulletEnemyHit(A:Mob, B:Bullet):void {
			if (B is Bullet) {
				A.hurtHP(Global._currentDamage);
				Global._playerBot.awardExp(Global.randomNumBetween(1,10));
			}
		}
		
		public function onEnemyPlayer(A:Robot, B:Mob):void {
			if (B is Mob) {
				A.hurtHP(2);
				if (A._isMovingToThe == 1) {
					A.x += 20;
				}
				
				if (A._isMovingToThe == 2) {
					A.x -= 20;
				}
				
			}
		}
		
		override public function update():void {
			
			//Actuate.tween(_cameraDoll, 0.5, {x:_testBot.x, y:_testBot.y});
			
			FlxG.collide(_enemyGroup,Global._playerBot._bulletGroup,onBulletEnemyHit);
			
			if (!Global._playerBot.alive) {
				FlxG.fade(0xff000000, 1, toGameOver);
			}
			
			FlxG.collide(_enemyGroup, _tileMap);
			FlxG.collide(Global._playerBot, _tileMap);
			FlxG.collide(Global._playerBot, _enemyGroup, onEnemyPlayer);
			FlxG.collide(Global._playerBot._bulletGroup, _tileMap);
			
			_interval += 1;
				
			if (_interval == _rateOfEnemies) {
				_enemyGroup.add(new Mob(Global.randomNumBetween(32,_tileMap.width - 32), 100));
				_interval = 0;
			}
			
			if (Global._playerBot._level == 10) {
				_rateOfEnemies = 50;
			}
			
			if (Global._playerBot._level == 20) {
				_rateOfEnemies = 40;
			}
			
			if (Global._playerBot._level == 30) {
				_rateOfEnemies = 30;
			}
			
			
			super.update();
		}
		
		public function toGameOver():void {
			FlxG.switchState(new GameOverState);
		}
		
	}
}