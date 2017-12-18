package sprite 
{
	/**
	 * ...
	 * @author ...
	 */
	public class SmallDoor extends Door 
	{
		[Embed(source = "../sprite/assets/SmallDoor.png")] private var doorPNG:Class;
		public function SmallDoor(X:Number, Y:Number, roomIndex:int, entryIndex:int) 
		{
			
			super(X, Y, roomIndex, entryIndex);
			loadGraphic(doorPNG, false, false, 15, 25, false);
		}
		
	}

}