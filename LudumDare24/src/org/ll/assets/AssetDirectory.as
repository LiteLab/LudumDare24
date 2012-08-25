package org.ll.assets {
	
	/*
	*
	* This class manages all assets and keeps them nice and tidy, uses static declarations so any class can grab the assets.
	*
	*/
	
	public class AssetDirectory {
		
		//Bots.
		[Embed(source="bots/greenbotv1.png")] public static var ImgPlayer:Class;
		
		//Objects.
		[Embed(source="objects/bullet.png")] public static var ImgBullet:Class;
		[Embed(source="objects/giantbullet.png")] public static var ImgGiantBullet:Class;
		
		//UI
		[Embed(source="ui/logo.png")] public static var ImgLogo:Class;
		
		public function AssetDirectory() {
		}
	}
}