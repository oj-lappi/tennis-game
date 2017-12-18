package sprite.state 
{
	/**
	 * ...
	 * @author Lappi
	 */
	import sprite.BallBoss;
	import sprite.BossBall;
	import org.flixel.*;
	import sprite.GameSprite;
	public class BossIdleState implements State 
	{
			private var spr:BallBoss;
			private var reverse:Boolean = false;
			private var counter:Number=0;
		public function BossIdleState(spr:BallBoss) 
		{
			this.spr = spr;
			
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			spr.velocity.x = 0;
			spr.velocity.y = 0;
			spr.angularVelocity = spr.velocity.x;
			if (spr.touching == FlxObject.FLOOR)
			reverse = !reverse;
			
			if (reverse)
				spr.play("reverse");
			else
				spr.play("idle");
				spr.mouth.play("chew");
			
			counter++;
			if (counter == 100){
			if(Math.random()>.6)
			spr.state = new BossShootState(spr);
			else
			spr.state = new BossChanceState(spr);
		return;		
			}
			
			spr.velocity.x = Math.sin(counter*Math.PI/49 )*150;
			spr.velocity.y = Math.cos(counter * Math.PI / 49) * 100;
			spr.velocity.x += (spr.floatLocation.x - spr.x)*.5;
			spr.velocity.y += (spr.floatLocation.y - spr.y)*.5;
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