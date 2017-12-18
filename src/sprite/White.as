package sprite 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class White extends FlxSprite 
	{
		[Embed(source = "../sprite/assets/White.png")] private var whitePNG:Class;
		public function White(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(whitePNG, true, true, 19, 19, false);
			immovable = true;
			
		}
		
	}

}