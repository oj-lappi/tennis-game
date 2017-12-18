package sprite 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Lasse
	 * 
	 * Klass som fungerar som ett tennisnät, idén är att den bara är häflten så hög som en vanlig ruta. 
	 * 
	 */
	public class TennisNet extends FlxSprite 
	{
		[Embed(source = "../sprite/assets/TennisNet.png")] private var netPNG:Class;
		
		public function TennisNet(X:int, Y:int ) {
				
			super(X, Y)
			immovable = true;
			solid = true;
			
			loadGraphic(netPNG, false, false, 4, 10, false);
		}
		
		override public function update():void {
			
			FlxG.collide(this, Registry.player);
			
		}
		
	}

}