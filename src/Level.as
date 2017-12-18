package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
		import org.flixel.FlxG;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Level extends FlxGroup
	{
		
		public var width:int;
		public var height:int;
		public var entries:FlxGroup;
		protected var bg:FlxGroup = new FlxGroup;
		public function Level(){	
		}
		public function init():void {
			Registry.backgroundLayer.add(bg);
			Registry.backgroundLayer.add(entries);
		}
		public function setplayer(entryIndex:int):void {
			
			Registry.justEntered = true;
			Registry.player.x = entries.members[entryIndex].x;
			Registry.player.y = entries.members[entryIndex].y;
			
		
		}	
	}
}