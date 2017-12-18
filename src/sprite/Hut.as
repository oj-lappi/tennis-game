package sprite 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
		import org.flixel.FlxG;
	/**
	 * ...
	 * @author Oskar
	 */
	public class Hut extends FlxSprite
	{
		[Embed(source = "assets/Hut.png")]private var png:Class;
		
		public function Hut(X:Number, Y:Number)
		{
			
			super(X, Y, png);
			
		}
		public function addHunter():void {
			var hunter:Hunter=new Hunter(x+3,y+9);
			Registry.enemies.add(hunter);
			hunter.init();
			FlxG.watch(	hunter, "angle", "angleaa");
		}
		
	}
	

}