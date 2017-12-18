package sprite.state {
	import sprite.GameSprite;
	import org.flixel.FlxObject;
	import sprite.Ball;
	import sprite.Projectile;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Lappi
	 */
	public class AutoShootState implements State 
	{
		private var spr:GameSprite;
		private var counter:int;
		private var counterInitial:int;
		private var projectile:Class;
		public function AutoShootState(spr:GameSprite,counter:int) 
		{this.spr = spr;
		counterInitial = counter;
		this.counter = counter;
		}
		
		/* INTERFACE sprite.State */
		
		public function animate():void 
		{
			counter--;
			if (counter == 0){
			counter = counterInitial;
			spr.play("idle");
			}
			else if (counter == counterInitial*3/4){
			spr.play("shoot");
			}else if (counter < counterInitial * 3 / 4 - 10 && counter % 10 == 0){
			var sign:int = (spr.facing==FlxObject.LEFT?-1:1);
			Registry.projectiles.add(new Ball(spr.x+spr.width*(sign+1)/2, spr.y + 20, sign*300,0 ));
			}
			
			
			for each(var obj:Projectile in Registry.projectiles.members){
				
				if (FlxG.overlap(spr, obj)) 
					hurt();
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
			spr.health--;
			
		}
		
	}

}