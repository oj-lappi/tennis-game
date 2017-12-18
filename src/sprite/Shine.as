package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Shine extends FlxSprite{
			[Embed(source = "../sprite/assets/Shine.png")] private var shinePNG:Class;

		public var stop:Boolean = false;
		public function Shine(X:Number , Y:Number ) {
		
		
			super(X, Y);
			loadGraphic(shinePNG, true, false, 68, 127, false);
			
			addAnimation("shine", [2,2, 3, 4, 5, 6,7, 7], 20, true);
			play("shine" );
		}
		override public function update():void {
			if (stop)
			frame = _curFrame;
			
		
		}
	}
	}

