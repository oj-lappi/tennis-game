package sprite {
	import org.flixel.*;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Closet extends GameSprite
	{
		private var occupied:Boolean;
			[Embed(source = "../sprite/assets/wardrobe.png")] private var wardrobePNG:Class;
			
		public function Closet(X:Number,Y:Number){
			super(X, Y);
			width = 30;
			height = 30;
			loadGraphic(wardrobePNG, true, true, 30, 30, false);
			//idle means OPEN,walk means CLOSED
			//TODO this is haxy
			addAnimation("idle", [1], 0, false);
			addAnimation("walk", [0], 0, false);
			

			
		}
		override public function update():void{
			state.animate();
			
			
		}

		
	}

}