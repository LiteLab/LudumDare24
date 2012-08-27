package org.ll.assets {
	
	/*
	*
	* This class manages all assets and keeps them nice and tidy, uses static declarations so any class can grab the assets.
	*
	*/
	
	public class AssetDirectory {
		
		//Bots.
		[Embed(source="bots/greenbotv1.png")] public static var ImgPlayerv1:Class;
		[Embed(source="bots/greenbotv2.png")] public static var ImgPlayerv2:Class;
		[Embed(source="bots/greenbotv3.png")] public static var ImgPlayerv3:Class;
		[Embed(source="bots/greenbotv4.png")] public static var ImgPlayerv4:Class;
		[Embed(source="bots/mob1.png")] public static var ImgMob1:Class;
		[Embed(source="bots/mob2.png")] public static var ImgMob2:Class;
		[Embed(source="bots/boss1.png")] public static var ImgBoss1:Class;
		[Embed(source="bots/boss2.png")] public static var ImgBoss2:Class;
		
		//Map.
		[Embed(source="maps/fulltiles.png")] public static var ImgTileMap:Class;
		[Embed(source="maps/Map1.csv", mimeType="application/octet-stream")] public static var Mp1:Class;
		[Embed(source="maps/Map2.csv", mimeType="application/octet-stream")] public static var Mp2:Class;
		[Embed(source="maps/Map3.csv", mimeType="application/octet-stream")] public static var Mp3:Class;
		
		[Embed(source="maps/firstbackbackground.png")] public static var MapBG1:Class;
		[Embed(source="maps/secondbackbackground.png")] public static var MapBG2:Class;
		[Embed(source="maps/thirdbackbackground.png")] public static var MapBG3:Class;
		
		//Objects.
		[Embed(source="objects/bullet.png")] public static var ImgBullet:Class;
		[Embed(source="objects/giantbullet.png")] public static var ImgGiantBullet:Class;
		[Embed(source="objects/bossgibs.png")] public static var ImgBossGibs:Class;
		[Embed(source="objects/gibs1.png")] public static var ImgGibs1:Class;
		[Embed(source="objects/gibs2.png")] public static var ImgGibs2:Class;
		[Embed(source="objects/gibs3.png")] public static var ImgGibs3:Class;
		
		//UI.
		[Embed(source="ui/logo.png")] public static var ImgLogo:Class;
		[Embed(source="ui/SRE.png")] public static var ImgSRE:Class;
		[Embed(source="ui/botcursor.png")] public static var ImgBotCursor:Class;
		
		[Embed(source="ui/play.png")] public static var ImgPlay:Class;
		[Embed(source="ui/about.png")] public static var ImgAbout:Class;
		[Embed(source="ui/AboutMsg.png")] public static var ImgAboutMsg:Class;
		[Embed(source="ui/gameover.png")] public static var ImgGameOver:Class;
		
		[Embed(source="ui/HPUI.png")] public static var ImgHPUI:Class;
		[Embed(source="ui/HPUIRed.png")] public static var ImgHPUIRedBar:Class;
		[Embed(source="ui/EXPUIYellow.png")] public static var ImgEXPUIYellowBar:Class;
		
		//Sound.
		[Embed(source="sound/hit1.mp3")] public static var SndHit1:Class;
		[Embed(source="sound/hit2.mp3")] public static var SndHit2:Class;
		[Embed(source="sound/jump1.mp3")] public static var SndJump1:Class;
		[Embed(source="sound/jump2.mp3")] public static var SndJump2:Class;
		[Embed(source="sound/jump3.mp3")] public static var SndJump3:Class;
		[Embed(source="sound/jump4.mp3")] public static var SndJump4:Class;
		[Embed(source="sound/land1.mp3")] public static var SndLand1:Class;
		[Embed(source="sound/land2.mp3")] public static var SndLand2:Class;
		[Embed(source="sound/land3.mp3")] public static var SndLand3:Class;
		[Embed(source="sound/land4.mp3")] public static var SndLand4:Class;
		[Embed(source="sound/bossland1.mp3")] public static var SndBossLand1:Class;
		[Embed(source="sound/bossland2.mp3")] public static var SndBossLand2:Class;
		[Embed(source="sound/bossland3.mp3")] public static var SndBossLand3:Class;
		[Embed(source="sound/bossland4.mp3")] public static var SndBossLand4:Class;
		[Embed(source="sound/shoot1.mp3")] public static var SndShoot1:Class;
		[Embed(source="sound/shoot2.mp3")] public static var SndShoot2:Class;
		[Embed(source="sound/shoot3.mp3")] public static var SndShoot3:Class;
		[Embed(source="sound/shoot4.mp3")] public static var SndShoot4:Class;
		[Embed(source="sound/lastgunshoot1.mp3")] public static var LastShoot1:Class;
		[Embed(source="sound/lastgunshoot2.mp3")] public static var LastShoot2:Class;
		[Embed(source="sound/lastgunshoot3.mp3")] public static var LastShoot3:Class;
		[Embed(source="sound/lastgunshoot4.mp3")] public static var LastShoot4:Class;
		
		public function AssetDirectory() {
		}
	}
}