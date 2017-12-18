package sprite 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Ufo extends TransportingSprite
	{
		
		public function Ufo(X:Number,Y:Number,playstate:PlayState)
		{
			roomIndex = 2;
			entryIndex = 0;
			//transportation code
			super(X, Y,playstate);
			
			
			
			
		}
		override public function update():void {
			if (FlxG.keys.justPressed("T")){
			transport();
			}
		}
		
	}

}