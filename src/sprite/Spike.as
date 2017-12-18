package sprite 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class Spike extends FlxGroup
	{
		public var killPoint:FlxSprite;
		private const size:Number = 10;
		public function Spike(X:Number, Y:Number,facing:Number)
		{
			if(facing==1){
			killPoint = new FlxSprite(X, Y+1);
			
			add(new FlxSprite(X + size / 2, Y))
		
			}else {
			killPoint = new FlxSprite(X+size*11/2, Y+1);
			
			add(new FlxSprite(X , Y))	
			}
				add(killPoint);
			
			killPoint.makeGraphic(size/1.2, size/1.2, 0xffffffff);
			members[0].makeGraphic(size * 6, size, 0xffffffff);
			killPoint.angle = 45;
		}
		
	}

}