package sprite 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author ...
	 */
	public class HomingMeteorite extends Meteorite 
	{
		protected var target:FlxSprite;
		public function HomingMeteorite(X:Number, Y:Number, velocityX:int, velocityY:int, isEffect:Boolean) 
		{
			maxVelocity = new FlxPoint(100,100);
			super(X, Y, velocityX, velocityY, isEffect);
			target = Registry.player;
			
		}
		override public function update():void {
			super.update();
			var dy:Number = target.y - y;
			var dx:Number = target.x - x;
			var l:Number = Math.sqrt(Math.pow(dy, 2) + Math.pow(dx, 2));
			acceleration.y =  dy*100/l-velocity.y/2 ;
			acceleration.x =  dx*100/l-velocity.x/2 ;
		}
	}

}