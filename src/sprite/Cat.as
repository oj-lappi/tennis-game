package sprite 
{
	/**
	 * ...
	 * @author Lappi
	 */
	import sprite.strategy.*;
	public class Cat extends GameSprite 
	{
		[Embed(source = "../sprite/assets/Cat.png")] private var catPNG:Class;
		public function Cat(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(catPNG,true, true,10,10,false);
			addAnimation("idle", [2,3,4,5,6,7,6,5,4,3], 10, true);		
			addAnimation("walk", [0, 1], 7, true);
			
			addAnimation("jump", [1], 0, false);
			acceleration.y = 200;
			strategy = new CatStrategy(this);
			drag.x = 10;
			maxVelocity.x = 100;
		}
		
	}

}