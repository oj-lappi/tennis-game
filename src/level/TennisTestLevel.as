package level 
{
	import org.flixel.*;
	import sprite.SmallDoor;
	import sprite.TennisNet;
	import sprite.TennisStatue;
	/**
	 * ...
	 * @author Lasse
	 * 
	 * Tennisplan med studsande bollar!
	 * 
	 */
	public class TennisTestLevel extends Level 
	{
		[Embed(source = "../level/assets/TennisTestSheet.png")]
		private var mapPNG:Class;
		
		[Embed(source = "../level/assets/TennisTest.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
		
		public static var tennisTeacher:TennisStatue;
		public static var net:FlxSprite = new TennisNet(388, 250);
		
		
		private var map:FlxTilemap;
		public function TennisTestLevel() {
			super();
			
			
			entries = new FlxGroup;
						
			entries.add(new SmallDoor(40, 230, 0, 0));
			entries.add(tennisTeacher = new TennisStatue(500, 230, 1));
			entries.add(net);
			
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 1);
			width = map.width;
			height = map.height;
			add(map);
			
		}
		
	}

}