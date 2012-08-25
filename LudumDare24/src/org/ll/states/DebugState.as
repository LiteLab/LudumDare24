package org.ll.states {
	
	import org.flixel.*;
	import org.ll.objects.Robot;
	
	public class DebugState extends FlxState {
		
		public var _testBot:Robot = new Robot(100,100);
		
		override public function create():void {
			add(_testBot);
			add(_testBot._bulletGroup);
		}
		
		override public function update():void {
			super.update();
		}
	}
}