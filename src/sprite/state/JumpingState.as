package sprite.state {
	import org.flixel.*;
	import sprite.GameSprite;
	import sprite.Projectile;
	import sprite.Player;
	/**
	 * ...
	 * @author Lappi
	 */
	public class JumpingState implements State 
	{
		private var spr:GameSprite;
		public function JumpingState(spr:GameSprite) 
		{
			this.spr = spr;
		}
		
		/* INTERFACE sprite.State */
		
		public function animate():void 
		{
			if (spr.touching == FlxObject.FLOOR)
			spr.state = new IdleState(spr);
			
			for each(var obj:Projectile in Registry.projectiles.members){
				
				if (FlxG.overlap(spr, obj)) 
					hurt();
			}
			
			if(spr.velocity.y>0)
				spr.play("fall");
			else spr.play("jump");
		}
		public function tryToSwing():void {
				spr.state = new ChargeState(spr as Player);
		}
		
		public function walk():void {
			
		}
		public function jump():void {

		}
		public function hurt():void {
		spr.state=new HurtState(spr);
		}
		
	}

}