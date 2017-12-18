package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Rubble extends FlxSprite 
	{
		protected var sign:int = 1;
		private var initialY:Number;
		public function Rubble(X:Number, Y:Number, sign:int) 
		{
			initialY = Y;
			this.sign = sign;
			super(X, Y);
			
			
		}
		override public function update():void {
			//angle = sign * 15;
			velocity.y = -200;
			acceleration.y = 50;
			if (y < initialY - 38){
			velocity.y = 0;
			velocity.x = 0;
			acceleration.y = 0;
		}
		}
		
	}

}