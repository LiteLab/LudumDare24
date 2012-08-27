package org.ll {
	import org.ll.objects.Robot;
	
	public class Global {
		
		public static var _playerBot:Robot = new Robot(100, 100);
		public static var _isBossOut:Boolean = false;
		public static var _currentDamage:int = 10;
		
		public static var _enemyKills:int = 0;
		public static var _bossKills:int = 0;
		
		static public function randomNumBetween(Num1:Number, Num2:Number):Number {
			return (Math.floor(Math.random() * (Num2 - Num1 + 1)) + Num1);
		}
	}
}