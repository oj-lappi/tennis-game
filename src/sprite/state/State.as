package sprite.state {
	import org.flixel.FlxSprite
	
	/**
	 * ...
	 * @author Lappi
	 */
	public interface State 
	{
	function animate():void;
	function hurt():void;
	
	//primarily for player
	function tryToSwing():void;
	function walk():void;
	function jump():void;

	}
	
	
}