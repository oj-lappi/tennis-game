package level 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	import sprite.BigDoor;
	import sprite.SmallDoor;
	import sprite.Door;
	import sprite.FloatingBall;
	import sprite.Tower;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author ...
	 */
	public class TowerRoom extends Level 
	{
		[Embed(source = "assets/Tiles.png")]private var mapPNG:Class;
			[Embed(source = "../level/assets/towerBG.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
			private var map:FlxTilemap;
		public function TowerRoom() 
		{
			super();
			entries = new FlxGroup;
			
			bg.add(new Tower(20, 151));
			bg.add(new FloatingBall(19, 80));
			var floor:FlxTileblock = new FlxTileblock(1, 400, 800,1);
			add(floor);
	
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20, 0, 0, 1, 12);
			width = map.width;
			height = map.height;
			entries.add(new SmallDoor(600, height-45,0,0));
			bg.add(map);
			
		}
	
		
	}

}