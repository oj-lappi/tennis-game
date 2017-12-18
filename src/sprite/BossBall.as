package sprite 
{
	/**
	 * ...
	 * @author Lappi
	 */
	
	import org.flixel.FlxSprite;
	import sprite.strategy.*;
	import sprite.state.*;
	public class BossBall extends Projectile
	{
		public var shadow:GameSprite;
		[Embed(source = "../sprite/assets/BossAlt.png")] private var bossPNG:Class;
		private var counterB:Number = 200;
		public function BossBall(X:Number,Y:Number,veloxityX:Number=0,velocityY:Number=0,scale:Number=1) 
		{
			super(X, Y);
			loadGraphic(bossPNG,true, true,40,40,false);
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 15, true);		
			addAnimation("reverse", [0, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 15, true);
			
			
			this.scale.x = scale;
			this.scale.y = scale;
			//acceleration.y = 200;
			
			drag.x = 1.3;
			maxVelocity.x = 200;
			maxVelocity.y = 200;
			elasticity = 1;
			velocity.x = veloxityX;
			velocity.y = velocityY;
			//strategy = new BossStrategy(this);
			//state = new BossIdleState(this);
			
			align();
		}
		private function align():void {
			width = width * scale.x;
			height = height * scale.y;
			offset.x = -(scale.x-1) / 2 * width / scale.x;
			offset.y = -(scale.y-1) / 2 * height / scale.y;
		}
		override public function update():void {
			super.update();
			
		
			
			
			play("idle");
			angle = Math.atan2(velocity.y , velocity.x) / 2 / Math.PI * 360;
			if (justTouched(ANY))
			kill();
			
		}
		public function explode():void {
			
			kill();
		}
		
	}

}