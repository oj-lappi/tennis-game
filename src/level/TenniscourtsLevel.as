package level {
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class TenniscourtsLevel extends Level
	{

		[Embed(source = "../level/assets/Tenniscourts.png")]
		private var mapPNG:Class;
		
		
		[Embed(source = "../level/assets/mapCSV_Group1_Map1.csv",
		mimeType = "application/octet-stream")]
		public var mapCSV:Class; 
		
		private var map:FlxTilemap;
		
		
		public function TenniscourtsLevel() {
			super();
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 20, 20,0, 0, 1, 30);
			
			width = map.width;
			height = map.height;
			add(map);
			add(Registry.player);
			add(new Net(6 * 20, 23 * 20));
		}
		
		
	}
}
import org.flixel.FlxSprite;
	class Net extends FlxSprite
	{
		[Embed(source = "../level/assets/Collidablenet.png")]
		private var netPNG:Class;
		public function Net(X:Number,Y:Number) 
		{
			super(X, Y);
			loadGraphic(netPNG, false, false, 20, 20, false)
			immovable = true;
			width = 1;
			height = 15;
			offset.x = 20;
			
			
			
		}
		
	}