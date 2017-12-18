package sprite 
{
	/**
	 * ...
	 * @author Lappi
	 */
		import org.flixel.*;
		import sprite.strategy.*;
		
	public class Dude extends GameSprite
	{
	
	[Embed(source = "../sprite/assets/player.png")] private var dudePNG:Class;
		public function Dude(X:Number,Y:Number ) 
		{
			super(X, Y);
			loadGraphic(dudePNG, true, true, 20, 20, true);
			
			addAnimation("idle", [0], 0, false);		
			addAnimation("walk", [1, 2], 10, true);
			addAnimation("jump", [1], 0, false);
			
			acceleration.y = 200;
			maxVelocity = new FlxPoint(200,200);
			
			strategy = new CatStrategy(this);
			health = 10;
			targets = new FlxGroup;
			targets.add(Registry.player);
		}
		
	}

}