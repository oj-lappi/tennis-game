package sprite 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Pupil extends FlxSprite
	{
		
		
		[Embed(source = "../sprite/assets/Pupil.png")] private var pupilPNG:Class;
		
		public function Pupil(X:Number,Y:Number) {
			super(X, Y);
			loadGraphic(pupilPNG, false, true, 5, 5, false);
			width = 5;
			height = 5;
			offset.x = 2.5;
			offset.y = 2.5;
		}
		
	}

}