package org.ll.assets {
	
	/*
	*
	* This class manages all assets and keeps them nice and tidy, uses static declarations so any class can grab the assets.
	*
	*/
	
	public class AssetDirectory {
		
		//Bots.
		[Embed(source="bots/greenbotv1.png")] public static var ImgPlayer:Class;
		[Embed(source="bots/mob1.png")] public static var ImgMob1:Class;
		[Embed(source="bots/mob2.png")] public static var ImgMob2:Class;
		[Embed(source="bots/boss1.png")] public static var ImgBoss1:Class;
		[Embed(source="bots/boss2.png")] public static var ImgBoss2:Class;
		
		//Objects.
		[Embed(source="objects/bullet.png")] public static var ImgBullet:Class;
		[Embed(source="objects/giantbullet.png")] public static var ImgGiantBullet:Class;
		[Embed(source="objects/botgibs.png")] public static var ImgBotGibs:Class;
		
		//UI
		[Embed(source="ui/logo.png")] public static var ImgLogo:Class;
		[Embed(source="ui/SRE.png")] public static var ImgSRE:Class;
		[Embed(source="ui/botcursor.png")] public static var ImgBotCursor:Class;
		
		[Embed(source="ui/play.png")] public static var ImgPlay:Class;
		[Embed(source="ui/about.png")] public static var ImgAbout:Class;
		[Embed(source="ui/AboutMsg.png")] public static var ImgAboutMsg:Class;
		[Embed(source="ui/gameover.png")] public static var ImgGameOver:Class;
		
		[Embed(source="ui/HPUI.png")] public static var ImgHPUI:Class;
		[Embed(source="ui/HPUIRed.png")] public static var ImgHPUIRedBar:Class;
		
		public function AssetDirectory() {
		}
	}
}