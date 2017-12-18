package sprite 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Lappi
	 */
	public class TransportingSprite extends FlxSprite
	{
		protected  var playstate:PlayState;
		protected var roomIndex:int;
		protected var entryIndex:int;
		public function TransportingSprite(X:Number,Y:Number,playstate:PlayState) 
		{
			super(X, Y);
			this.playstate=playstate;
			}
		protected function transport():void{
			playstate.loadRoom(roomIndex,entryIndex);
		}
		
	}

}