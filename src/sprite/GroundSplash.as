package sprite 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GroundSplash extends FlxSprite 
	{
				[Embed(source = "../sprite/assets/Burst.png")] private var splashPNG:Class;
		
		public function GroundSplash(X:Number, Y:Number){
			super(X, Y);
			immovable = true;
			loadGraphic(splashPNG,false, false, 177, 75, false);
		}
		
	}
	class A extends FlxSprite{
			public function A(){
				
			}
	}
	class B extends FlxSprite{
			public function B(){
				
			}
	}
	class C extends FlxSprite{
			public function C(){
				
			}
	}
	class D extends FlxSprite{
			public function D(){
				
			}
	}

}