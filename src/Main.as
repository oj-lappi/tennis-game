package 
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	import flash.system.Capabilities;
	public class Main extends FlxGame{
		public function Main(){
			super(Capabilities.screenResolutionX / 3, Capabilities.screenResolutionY / 3,PlayState, 3, 60, 60);
			
			forceDebugger = true;
			
		}
	}
}