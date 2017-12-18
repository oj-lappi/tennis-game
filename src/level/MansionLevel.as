package level 
{
	import org.flixel.*;
	import sprite.SmallDoor;
	/**
	 * ...
	 * @author Oskar
	 */
	public class MansionLevel extends Level 
	{
		
		[Embed(source = "assets/mansion.png")]private var mapPNG:Class;
			[Embed(source = "../level/assets/mansion.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
			private var map:FlxTilemap;
		public function MansionLevel() 
		{
			super();
			entries = new FlxGroup;
			
			
	
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 12);
			width = map.width;
			height = map.height;
			bg.add(map);
			entries.add(new SmallDoor(20, height - 25, 0, 0));
			add(new FlxTileblock(0, height, width, 1));
			
		
	}

}
}