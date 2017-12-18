package level 
{
	import org.flixel.*;
	import sprite.SmallDoor;
	/**
	 * ...
	 * @author Lappi
	 */
	public class UFOLevel extends Level
	{
		[Embed(source = "../level/assets/UFOtiles.png")]
		private var mapPNG:Class;
		
		[Embed(source = "../level/assets/ufomapcsv.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
		
		private var map:FlxTilemap;
		
		public function UFOLevel() {
			super();
			entries = new FlxGroup;
			
			entries.add(new SmallDoor(30, 30, 0, 0));
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 1);
			
			width = map.width;
			height = map.height;
			add(map);
			
			
		}
		
	}
		
	}

