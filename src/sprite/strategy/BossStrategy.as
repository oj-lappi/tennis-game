package sprite.strategy {
	/**
	 * ...
	 * @author Lappi
	 */
	import sprite.BallBoss;
	public class BossStrategy implements Strategy 
	{
		private var spr:BallBoss;
		public function BossStrategy(spr:BallBoss) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.strategy.Strategy */
		
		public function behave():void 
		{
			
		}
		
	}

}