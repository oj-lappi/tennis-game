package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Tower extends FlxSprite 
	{
		[Embed(source = "../sprite/assets/Tower.png")] private var towerPNG:Class;
		public function Tower(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(towerPNG, false, true, 56, 241,false);
		}
		
	}

}