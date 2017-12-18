package sprite.state 
{
	import sprite.BallBoss;
	import sprite.HomingMeteorite;
	import sprite.HomingTennisBall;
	/**
	 * ...
	 * @author Oskar
	 */
	public class BossChanceState implements State 
	{
		private var spr:BallBoss;
		private var counter:Number = 0;
		private var ball:HomingTennisBall;
		
		public function BossChanceState(spr:BallBoss) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			counter++;
			if (counter == 20){
			spr.mouth.frame = 4;
			ball = new HomingTennisBall(spr.mouth.getMidpoint().x - 20, spr.mouth.getMidpoint().y - 20, this.spr);
			ball.play("idle");
			Registry.projectiles.add(ball);
			}
			
			if (ball!=null&&spr.mouth.overlaps(ball)&&ball.target==spr){
			hurt();
			ball.kill();
			}
			if (ball!=null&&(ball.overlaps(Registry.player)||ball.counter>300)){
				ball.explode()
				spr.state = new BossIdleState(spr);
			}
			spr.velocity.x = Math.sin(-counter*Math.PI/69 )*70;
			spr.velocity.y = Math.cos(-counter * Math.PI / 69) * 70;
			spr.velocity.x += (spr.floatLocation.x - spr.x)*.5;
			spr.velocity.y += (spr.floatLocation.y - spr.y)*.5;
		}
		
		public function hurt():void 
		{
			spr.state = new BossRollState(spr);
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