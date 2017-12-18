package sprite.state {
	import org.flixel.*;
	import sprite.GameSprite;
	import sprite.Player;
	import sprite.Projectile;
	/**
	 * ...
	 * @author Lappi
	 */
	public class IdleState implements State 
	{
		private var spr:GameSprite;
		
		private var otherway:uint;
		public function IdleState(spr:GameSprite) 
		{
			this.spr = spr;

		
			
			
		}
		
		/* INTERFACE sprite.State */
		
		public function animate():void 
		{
			for each(var obj:Projectile in Registry.projectiles.members){
				
				if (FlxG.overlap(spr, obj)) 
					hurt();
			}
			
			spr.play("idle");
		}
		public function tryToSwing():void {
			
			spr.state = new ChargeState(spr as Player);
		}
	
		public function walk():void {
			spr.state= new WalkState(spr);
	
		}
		public function jump():void {
			spr.state = new JumpingState(spr);
			
			
		}
		public function hurt():void {
			spr.state=new HurtState(spr);
		}
	
	}

}