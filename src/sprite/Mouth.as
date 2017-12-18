package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Mouth extends FlxSprite 
	{
		private var count:int = 10;

	
		[Embed(source = "../sprite/assets/Mouth.png")] private var mouthPNG:Class;
		public function Mouth(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(mouthPNG,true, true,58,36,false);
			addAnimation("idle", [0], 0, false);
			addAnimation("chew", [0, 1, 2, 3], 15, true);
			addAnimation("open", [4],0, false);
			width = 58;
			height = 36;
			
		
			play("chew");
		}
		override public function update():void {
		
		}
		
		}

}