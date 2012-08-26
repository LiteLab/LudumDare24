package org.ll {
	import org.ll.objects.Robot;
	
	public class Global {
		
		public static var _playerBot:Robot = new Robot(100, 100);
		
		public function Global()
		{
		}
		
		static public function randomNumBetween(Num1:Number, Num2:Number):Number {
			return (Math.floor(Math.random() * (Num2 - Num1 + 1)) + Num1);
		}
	}
}