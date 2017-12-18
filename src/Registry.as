package  
{
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxLinkedGroup;
	import sprite.Player;
	import sprite.TennisStatue;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Registry 
	{
		public static var room:Level;
		public static var player:Player;
		public static var playerLayer:FlxGroup = new FlxGroup;
		public static var projectiles:FlxGroup = new FlxGroup;
		public static var npcs:FlxGroup = new FlxGroup;
		public static var enemies:FlxGroup = new FlxGroup;
		public static var bgEnemies:FlxGroup = new FlxGroup;
		public static var collidableEnemies:FlxGroup = new FlxGroup;
		public static var selfcollidingGroup:FlxGroup = new FlxGroup;
		public static var smokeLayer:FlxGroup = new FlxGroup;
		public static var backgroundLayer:FlxGroup = new FlxGroup;
		public static var effects:FlxGroup = new FlxGroup;
		
		//only for big multipart bosses
		public static var bossLayer:FlxGroup = new FlxGroup;
		
		public static var playstate:PlayState;
		public static var justEntered:Boolean;
		
		
		public static var bouncy:Boolean = false;
		public static var grounded:FlxGroup = new FlxGroup;
		
		public function Registry() 
		{
			
		}
		
	}

}