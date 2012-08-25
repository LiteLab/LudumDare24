package org.ll.objects {
	
	import org.flixel.*;
	import org.ll.objects.Bullet;
	
	/*
	*
	* This is the class that holds all the bullets, and has abilities to add bullets as well.
	*
	*/
	
	public class BulletGroup extends FlxGroup {
		
		public function BulletGroup() {
			// Let's make sure the player never run out of bullet space.
			super(4294967295);
		}
		
		public function addNewBullet(X:Number, Y:Number, Type:int, Direction:int):void {
			super.add(new Bullet(X, Y, Type, Direction));
		}
		
		override public function update():void {
			super.update();
		}
	}
}