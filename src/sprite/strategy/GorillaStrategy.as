package sprite.strategy 
{
	import sprite.GameSprite;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Oskar
	 */
	public class GorillaStrategy implements Strategy 
	{
		private var spr:GameSprite;
		public function GorillaStrategy(spr:GameSprite) 
		{
			this.spr = spr;
			spr.velocity.x = 40;
		}
		
		/* INTERFACE sprite.strategy.Strategy */
		
		public function behave():void 
		{
			/*var a:Number = Math.random();
			if (a > .8) {
				if(spr.velocity.x!=0)
				spr.velocity.x = 0;
				else if (a > .9)
				spr.velocity.x = 40;
				else
				spr.velocity.x = -40;
			}
			*/
			if (spr.touching == FlxObject.WALL)
			spr.velocity.x = -spr.velocity.x;
			
		}
		
	}

}