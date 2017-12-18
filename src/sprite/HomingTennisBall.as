package sprite 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oskar
	 */
	public class HomingTennisBall extends BossBall
	{
		
		private var shooter:FlxSprite;
		public var target:FlxSprite;
		public var counter:Number = 0;
		private var lastFX:FlxSprite;
		private var speed:Number=1;
		public function HomingTennisBall(X:Number,Y:Number,shooter:FlxSprite) 
		{
			super(X, Y);
			weight = .00002;
			lastFX = this;
			this.shooter = shooter;
			target = Registry.player;
		}
		override public function update():void {
			
			counter++;
			
			var dy:Number = target.getMidpoint().y - (y+height/2);
			var dx:Number = target.getMidpoint().x - (x+width/2);
			var l:Number = Math.sqrt(Math.pow(dy, 2) + Math.pow(dx, 2));
			velocity.y =  (dy * 100*speed / l +velocity.y)/2
			velocity.x =  (dx * 100*speed / l +velocity.x)/2
			/*
			var fadeFX:Meteorite = new Meteorite(getMidpoint().x-7, getMidpoint().y-7, 0, 0, true,2,0xffffff3f);
				Registry.effects.add(fadeFX);
				fadeFX.angle = Math.atan(velocity.y / velocity.x) * 360 / (2 * Math.PI);
				fadeFX.father = lastFX;
				lastFX = fadeFX;
				angle = Math.atan2(velocity.y , velocity.x) /2/Math.PI* 360;
				
				*/
			
			}
		override public function justHit():void {
			target = shooter;
			counter = 0;
			speed += 1;
		}
		override public function explode():void {
			for (var i:Number = 0; i < 2*Math.PI;i+=Math.PI/12)
			Registry.projectiles.add(new VanishingBall(x + 20, y + 20, 100 * Math.cos(i), 100*Math.sin(i)));
			kill();
		}
		
		
	}

}