package org.ll.ui {
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	public class HPBar extends FlxSprite {
		
		public var _redHPBar:FlxSprite = new FlxSprite(17, 34);
		public var _grouped:FlxGroup = new FlxGroup(2);
		
		public function HPBar() {
			this.loadGraphic(AssetDirectory.ImgHPUI, false, false, 32, 42);
			this.x = 17;
			this.y = 12;
			this.scrollFactor.x = 0;
			this.scrollFactor.y = 0;
			
			_redHPBar.loadGraphic(AssetDirectory.ImgHPUIRedBar, false, false, 32, 8);
			_grouped.add(this);
			_grouped.add(_redHPBar);
		}
		
		override public function update():void {
			// X IS CURRENT HP.
			FlxG.log(_redHPBar.frameWidth);
			//_redHPBar.width = (Global._playerBot.health/100) * 32;
			//_redHPBar.scale.x = (Global._playerBot.health/100) * 32;
			
			_redHPBar.scale.x = (Global._playerBot.health/100);
			_redHPBar.width = (Global._playerBot.health/100);
			
			
			super.update();
		}
	}
}