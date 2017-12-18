package level 
{
		import org.flixel.*;
		import sprite.Rosedoor;
		import sprite.SmallDoor;

	/**
	 * ...
	 * @author Lappi
	 */
	public class TestLevel extends Level 
	{
		[Embed(source = "../level/assets/UFOtiles.png")]
		private var mapPNG:Class;
		
		[Embed(source = "../level/assets/testlevel.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
		
		private var map:FlxTilemap;
		public function TestLevel() 
		{
			entries = new FlxGroup;
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 1);
			width = map.width;
			height = map.height;
			entries.add(new SmallDoor(40, height-45, 5, 0));
			entries.add(new SmallDoor(100, height-45, 0, 1));
			entries.add(new SmallDoor(200, height-45, 7, 0));
			entries.add(new SmallDoor(250, height-45, 3, 0));
			entries.add(new SmallDoor(300, height-45, 6, 0));
			
			add(map);
			
		}
		override public function init():void {
			super.init();
			
			
		}
	}

}