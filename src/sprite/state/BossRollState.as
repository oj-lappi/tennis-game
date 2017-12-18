package sprite.state 
{
	import org.flixel.FlxSprite;
	import sprite.BallBoss;
	import sprite.GameSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Lappi
	 */
	public class BossRollState implements State 
	{
		private var spr:BallBoss;
		private var counter:Number;
		public function BossRollState(spr:BallBoss) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			counter++;
			if (counter > 50)
			spr.resetState();
			spr.acceleration.y = 200;
			spr.face.members[0].play("hurt");
			spr.face.members[1].play("hurt");
			//won't hurt player
			//let's player roll on him
			FlxG.collide(Registry.player, spr);
			//if(overlaps)
			for each(var s:FlxSprite in spr.hazards.members){
			if(s.overlaps(spr)){
			spr.makeSpray(s);
			}
			
			}
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