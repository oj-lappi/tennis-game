package sprite.state 
{
	import sprite.GameSprite;
	import sprite.Projectile;
	import sprite.Rosedoor;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Oskar
	 */
	public class HunterShootState implements State 
		{[Embed(source="../assets/Bullet.png")]private var bullet:Class;
		private var spr:GameSprite;
		private var counter:Number
		public function HunterShootState(spr:GameSprite){
			this.spr = spr;
			counter = 0;
		}
		
		/* INTERFACE sprite.state.State */
		
		public function animate():void {
			
			 counter++;
			 if (counter == 100)
			  spr.play("reload");
			 if (counter == 200) {
				 spr.play("shoot",true);
				 var sign:Number = (spr.facing == FlxObject.LEFT? -1:1);
				 var xdirection:Number = sign*Math.cos((spr.angle) * Math.PI / 180)*10;
				 var ydirection:Number = sign*Math.sin((spr.angle) * Math.PI / 180)*10;
				 var p:Projectile = new Projectile(spr.x + 11 + xdirection, spr.y + 8 + ydirection,bullet);
				 Registry.projectiles.add(p);
				 p.velocity.x = (xdirection+Math.random()*2-1)*20;
				 p.velocity.y = (ydirection +Math.random()*2-1)*20;
				 p.elasticity = 1;
				 counter = 0;
				
			 }
			
			 
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