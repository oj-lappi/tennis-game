package sprite 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class FloatingBall extends FlxSprite 
	{
		private var initP:FlxPoint;
		private var d:FlxPoint= new FlxPoint(0, 0);
		[Embed(source = "../sprite/assets/FloatingBall.png")] private var ballPNG:Class;
		public function FloatingBall(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(ballPNG, false, false, 63, 63, false);
			initP = new FlxPoint(X, Y);
			
		}
		override public function update():void {
			if (Math.abs(d.x) > 3)
			d.x = d.x * 3 / 4;
			if (Math.abs(d.y) > 3)
			d.y = d.y * 3 / 4;
			d.x += Math.random() * 2 - 1;
			d.y += Math.random() * 2 - 1;
			x = initP.x + d.x;
			y = initP.y + d.y;
		}
		
	}

}