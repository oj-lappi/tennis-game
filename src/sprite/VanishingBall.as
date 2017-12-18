package sprite 
{
	/**
	 * ...
	 * @author ...
	 */
	public class VanishingBall extends Ball 
	{
		private var counter:Number = 0;
		public function VanishingBall(X:Number, Y:Number, velocityX:int, velocityY:int) 
		{
			super(X, Y, velocityX, velocityY);
			
		}
		override public function update():void {
		super.update();
		counter++;
		alpha -= 1 / 600;
		if (counter == 300)
		kill();
		}
		
	}

}