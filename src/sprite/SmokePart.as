package sprite 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class SmokePart  extends FlxSprite
	{
		private var count:int = 0;
		[Embed(source = "../sprite/assets/Smoke.png")] private var smokePNG:Class;
		public function SmokePart(X:Number, Y:Number)
		{
		super(X, Y);
		
		loadGraphic(smokePNG, true, true, 10, 10, false);
		
		
		}
		override public function update():void {
			if (y < -9||velocity.y>-5)
			kill();
			count++;
			if (count == 19) {
				
				var rand:Number = (Math.random() * 16-3 ) / 20;
				velocity.y -= rand;
				x += (Math.random() * 20 - 10) / 14;
				
				randomFrame();
				count = 0;
			}
		}
	}

}