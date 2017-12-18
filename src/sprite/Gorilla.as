package sprite 
{
	import sprite.strategy.GorillaStrategy;
	/**
	 * ...
	 * @author Oskar
	 */
	public class Gorilla extends GameSprite
	{
		[Embed(source = "assets/Gorilla.png")]private var png:Class;
		public function Gorilla(X:Number,Y:Number){
			super(X, Y);
			loadGraphic(png, true, true, 20, 20, false);
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [ 3,3, 1, 4,5,5],10, true);
			addAnimation("jump", [1, 4], 5, false);
			acceleration.y = 200;
			strategy = new GorillaStrategy(this);
			
			maxVelocity.x = 20;
			
		}
		
	}

}