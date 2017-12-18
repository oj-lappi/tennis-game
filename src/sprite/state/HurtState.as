package sprite.state {
	import sprite.GameSprite;
	
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Lappi
	 */
	public class HurtState implements State 
	{
		private var counter:int;
		private var spr:GameSprite;
		public function HurtState(spr:GameSprite) 
		{
		this.spr = spr;	
		counter = 30;
		spr.health--;
		spr.flicker(-1);
		
		}
		
		
		
		public function animate():void 
		{
			
			if (spr.health <= 0)
			spr.kill();
			spr.play("jump");
			counter--;
			
			if (counter < 1) {
				spr.flicker(1);
		
			spr.state = new IdleState(spr);
			
			}
		}
		public function tryToSwing():void {
		
		}
		
		public function walk():void {
			
		}
		public function jump():void {
			
		}
		public function hurt():void {
			
		}
		
	}

}