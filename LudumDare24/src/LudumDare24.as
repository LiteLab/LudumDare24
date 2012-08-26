package {
	import org.flixel.*;
	import org.ll.states.*;
	
	[SWF(width="1024", height="768", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	public class LudumDare24 extends FlxGame {
		public function LudumDare24() {
			super(512, 384, DebugState, 2, 60, 60, true);
			this.forceDebugger = true;
		}
	}
}