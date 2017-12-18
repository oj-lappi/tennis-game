package level {
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Lappi
	 */
	public class DesertLevel extends Level
	{

		[Embed(source = "../level/assets/tilemap.png")]
		private var mapPNG:Class;
		
		[Embed(source = "../level/assets/mapCSV_Group1_Map2.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class;
		
		private var map:FlxTilemap;
		
		public function DesertLevel() {
			super();
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 1);
			
			width = map.width;
			height = map.height;
			add(map);
			
		}
		
	}

}