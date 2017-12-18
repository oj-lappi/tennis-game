package sprite 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import sprite.state.*;
	import sprite.strategy.*;
	/**
	 * ...
	 * @author Lappi
	 */
	public class GameSprite extends FlxSprite
	{
		public var state:State;
		public var strength:int;
		public var nextBall:int;
		public var strategy:Strategy;
		public var targets:FlxGroup;
		public var weight:int = 10;
		public var isPlayer:Boolean = false;
		
		
	
		
		public function GameSprite(X:Number,Y:Number,SimpleGraphic:Class=null) {
			super(X, Y,SimpleGraphic);
			state = new IdleState(this);
			strategy = new EmptyStrategy;
		}
		override public function update():void {
			strategy.behave();
			if (touching != FlxObject.FLOOR)
				state.jump();
			else if (velocity.x != 0)
				state.walk();
				
			state.animate();
		}
	}
	
}