package sprite.state 
{
	import sprite.GameSprite;
	import org.flixel.FlxG;
	import sprite.Projectile;
	import sprite.Player;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Lappi
	 */
	public class ChargeState implements State 
	{
		
		public var spr:Player;
		private var counter:int;
		
		public function ChargeState(spr:Player) 
		{
			if (!spr.isPlayer)
			spr.state = new SwingingState(spr);
			this.spr = spr;
			counter = 0;
			
			
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void 
		{
			spr.torso.frame = 1;
			if (spr.touching != FlxObject.FLOOR) {
			if (spr.velocity.y > 0)
			spr.play("fallhalf");
			else
			spr.play("jumphalf");
			}
			else if (spr.velocity.x != 0)
			spr.play("walk");
			else{
			spr.play("charge");
			spr.torso.frame = 4;
			}
			
			for each(var obj:Projectile in Registry.projectiles.members){
				
				if (FlxG.overlap(spr, obj)) 
					hurt();
			}
			if (!FlxG.keys.Z)
				if (counter > 100)
					spr.state = new ChargedSwingState(spr);
				
				else
					spr.state = new SwingingState(spr);
			if (counter > 100)
				;
			else{
				counter++;
				
			}
			}
		
		public function tryToSwing():void 
		{
			
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