package sprite 
{
	import org.flixel.FlxObject;
	import sprite.state.AutoShootState;
	import sprite.strategy.EmptyStrategy;
	/**
	 * ...
	 * @author Lappi
	 */
	public class TennisMachine extends GameSprite
	{
		[Embed(source = "../sprite/assets/TennisMachine.png")] private var alienPNG:Class;
		public function TennisMachine (X:Number, Y:Number) 
		{
			super(X, Y);
			width = 40;
			height = 40;
			loadGraphic(alienPNG, true, true,30, 40, true);
			addAnimation("idle", [0], 0, false);		
			addAnimation("shoot", [1, 0, 0], 5, false);
			
			state = new AutoShootState(this, 100);
			acceleration.y = 10;
			facing = FlxObject.RIGHT;
			strategy = new EmptyStrategy;
			health = 30;
		}
		override public function update():void {
			
			
			state.animate();
		}
		
	}

}