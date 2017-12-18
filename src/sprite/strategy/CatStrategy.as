package sprite.strategy {
	/**
	 * ...
	 * @author Lappi
	 */
	import sprite.GameSprite;
	public class CatStrategy implements Strategy 
	{
		private var spr:GameSprite;
		private var coolDown:int;
		public function CatStrategy(spr:GameSprite)
		{
			this.spr = spr;
			coolDown = 70;
		}
		/* INTERFACE sprite.Strategy */
		public function behave():void 
		{
			coolDown--;
			if(coolDown<0){
			spr.acceleration.x = Math.floor(Math.random() * 80) - 40;
			if (Math.abs(spr.acceleration.x) < 30){
				if(Math.abs(spr.velocity.x) < 20)
					spr.acceleration.x = 0;
				else
					spr.velocity.y = -100;	
			}
			coolDown = Math.floor(Math.random() * 150)+50;
			}
		}
	}
}