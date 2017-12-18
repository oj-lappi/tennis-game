package sprite 
{
	/**
	 * ...
	 * @author ...
	 */
	public class BigDoor extends Door 
	{
		[Embed(source = "../sprite/assets/Door.png")] private var doorPNG:Class;
		public function BigDoor(X:Number,Y:Number,roomIndex:int,entryIndex:int) 
		{
			super(X, Y,roomIndex,entryIndex);
			loadGraphic(doorPNG, false,false, 91, 60,false);
			
		}
		
	}

}