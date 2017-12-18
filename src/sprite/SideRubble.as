package sprite{
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author ...
	 */
	public class SideRubble extends Rubble{
		[Embed(source = "../sprite/assets/SideRubbleA.png")] private var rubbleaPNG:Class;
		[Embed(source = "../sprite/assets/SideRubbleB.png")] private var rubblebPNG:Class;
		[Embed(source = "../sprite/assets/SideRubbleC.png")] private var rubblecPNG:Class;
		public function SideRubble(X:Number,Y:Number,sign:int){
			super(X, Y, sign);
			loadGraphic(rubbleaPNG, true, true, 77, 39, true);
			if (sign == -1)
			facing = FlxObject.LEFT;
		}
		override public function update():void{
			velocity.x = -sign * 400;
			super.update();
		}
	}
}