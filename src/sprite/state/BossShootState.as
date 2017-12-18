package sprite.state 
{
	import sprite.Ball;
	import sprite.BallBoss;
		import sprite.BossBall;
	/**
	 * ...
	 * @author Oskar
	 */
	public class BossShootState implements State 
	{
		private var spr:BallBoss;
		private var counter:int = 0;
		private var counter2:Number=0;
		public function BossShootState(spr:BallBoss) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			counter+=2;
			if (counter > 500)
			spr.state = new BossIdleState(spr);
			
			spr.mouth.frame = 4;
			spr.frame = 0;
			if(counter%10==0){
			Registry.projectiles.add(new BossBall(spr.mouth.getMidpoint().x-20*spr.scale.x/8, spr.mouth.getMidpoint().y-20*spr.scale.y/8, 100*Math.sin(counter/11*Math.PI), 100*Math.cos(counter/11*Math.PI),spr.scale.x/8));
			
		
			}
			spr.velocity.x = Math.sin(-counter*Math.PI/49 )*20;
			spr.velocity.y = Math.cos(-counter * Math.PI / 49)*20;
			spr.velocity.x += (spr.floatLocation.x - spr.x)*.5;
			spr.velocity.y += (spr.floatLocation.y - spr.y)*.5;
			
		}
		
		public function hurt():void 
		{
			
		}
		
		public function tryToSwing():void 
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