package sprite 
{
	import level.TennisTestLevel;
	import org.flixel.*;
	import sprite.state.SwingingState;
	import mx.utils.ObjectUtil;
	
	/**
	 * ...
	 * @author Lasse
	 * 
	 * Boll som stannar efter att ha studsat två gånger, lite sådär tennisliknande regler.
	 * 
	 */
	public class BouncyBall extends Projectile
	{
		
		
		[Embed(source = "../sprite/assets/Ball.png")] private var ballPNG:Class;
		private var speed:int;
		private var bounces:int = 0;
		
		
		
		public function BouncyBall(X:Number,Y:Number,velocityX:int,velocityY:int) {
				
			super(X, Y);
			
			
			loadGraphic(ballPNG, false, true, 2, 2,false);
			
			acceleration.y = 80;
			elasticity = 0.95;
			width = 2;
			height = 2;
			
			
			this.facing = facing;
			
			velocity.x = velocityX;
			velocity.y = velocityY;
			
		
		}
		
		override public function update():void {
			
			super.update();
			
			if (FlxG.overlap(this, TennisTestLevel.net) || FlxG.overlap(this, Registry.player) || FlxG.overlap(this, Registry.npcs)) {
				
				elasticity = 0;
				velocity.y = 30;
				velocity.x = 0;
				
				Registry.grounded.add(this);
				Registry.projectiles.remove(this);
				
				
			}
			
			if (this.justTouched(FlxObject.FLOOR) || this.justTouched(FlxObject.WALL)) {
				bounces++;
				if (bounces == 2) {
					drag = new FlxPoint(50, 75);
					elasticity = 0.2;
			}			
		}
	}
	
	override public function justHit():void {
				
				acceleration.y = 80;
				elasticity = 0.95;
				bounces = 0;				
				
				
			}
}
}
