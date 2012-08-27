package org.ll.ui {
	
	import org.flixel.*;
	import org.ll.Global;
	import org.ll.assets.AssetDirectory;
	
	public class HPBar extends FlxSprite {
		
		public var _redHPBar:FlxSprite = new FlxSprite(20, 42);
		public var _yellowEXPBar:FlxSprite = new FlxSprite(20, 51);
		public var _grouped:FlxGroup = new FlxGroup(4);
		
		public var _levelTxt:FlxText = new FlxText(19, 57, 32, "EVOLVE.");
		
		public function HPBar() {
			this.loadGraphic(AssetDirectory.ImgHPUI, false, false, 32, 51);
			this.x = 20;
			this.y = 20;
			this.scrollFactor.x = 0;
			this.scrollFactor.y = 0;
			
			_levelTxt.scrollFactor.x = 0;
			_levelTxt.alignment = "center";
			_levelTxt.scrollFactor.y = 0;
			_levelTxt.size = 8;
			_levelTxt.color = 0xff613D73;
			
			_redHPBar.loadGraphic(AssetDirectory.ImgHPUIRedBar, false, false, 32, 8);
			_yellowEXPBar.loadGraphic(AssetDirectory.ImgEXPUIYellowBar, false, false, 32, 8);
			_yellowEXPBar.scrollFactor.x = 0;
			_yellowEXPBar.scrollFactor.y = 0;
			_redHPBar.scrollFactor.x = 0;
			_redHPBar.scrollFactor.y = 0;
			_grouped.add(this);
			_grouped.add(_redHPBar);
			_grouped.add(_yellowEXPBar);
			_grouped.add(_levelTxt);
		}
		
		override public function update():void {
			// X IS CURRENT HP.
			//FlxG.log(_redHPBar.frameWidth);
			//_redHPBar.width = (Global._playerBot.health/100) * 32;
			//_redHPBar.scale.x = (Global._playerBot.health/100) * 32;
			
			_redHPBar.scale.x = (Global._playerBot.health/100);
			_redHPBar.width = (Global._playerBot.health/100);
			
			_yellowEXPBar.scale.x = (Global._playerBot._exp/100);
			_yellowEXPBar.width = (Global._playerBot._exp/100);
			
			_levelTxt.text = Global._playerBot._level.toString();
			
			
			super.update();
		}
	}
}