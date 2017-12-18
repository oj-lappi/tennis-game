package sprite.strategy 
{
	import sprite.GameSprite;
	import sprite.state.HunterShootState;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Oskar
	 */
	public class HunterStrategy implements Strategy 
	{
		private var spr:GameSprite;
		public function HunterStrategy(spr:GameSprite) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.strategy.Strategy */
		
		public function behave():void 
		{
			var sign:Number = (spr.facing == FlxObject.LEFT? -1:1);
			var d:Number=(Registry.player.x-spr.x)*sign;
			if (d<20&&d>=0)
			spr.state = new HunterShootState(spr); 
		}
		
	}

}