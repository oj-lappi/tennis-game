package sprite.state {
	import org.flixel.*;
	import sprite.GameSprite;
	import sprite.Projectile;
	import sprite.Player;
	/**
	 * ...
	 * @author Lappi
	 */
	public class WalkState implements State 
	{
		private var spr:GameSprite;
		public function WalkState(spr:GameSprite) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.State */
		
		public function animate():void {
		
			if (spr.velocity.x == 0)
			spr.state = new IdleState(spr);
			for each(var obj:Projectile in Registry.projectiles.members)
				if (FlxG.overlap(spr, obj)) {
					spr.state = new HurtState(spr);
					return;}
				if (spr.velocity.x > 0)
					spr.facing = FlxObject.RIGHT;
				else if(spr.velocity.x<0)
					spr.facing = FlxObject.LEFT;
				spr.play("walk");
		}
		public function tryToSwing():void {
			
			spr.state=new ChargeState(spr as Player);
		}
		
		
		public function walk():void {
			
		}
		public function jump():void {
			
			spr.state= new JumpingState(spr);
			
		}
		public function hurt():void {
			spr.state=new HurtState(spr);
		}
		
	}

}