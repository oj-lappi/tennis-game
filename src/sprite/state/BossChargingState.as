package sprite.state 
{
	/**
	 * ...
	 * @author Lappi
	 */
	public class BossChargingState implements State 
	{
		private var spr:GameSprite;
		public function BossChargingState( spr:GameSprite) 
		{
			this.spr = spr;
			spr.angularVelocity = 50;
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			
		}
		
		public function tryToSwing():void 
		{
			
		}
		
	
		public function hurt():void 
		{
			
		}
		
		public function walk():void 
		{
			
		}
		
		public function jump():void 
		{
			
		}
	
		
	}

}