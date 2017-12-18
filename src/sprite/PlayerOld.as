package sprite {
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import sprite.state.IdleState;
	
	/**
	 * ...
	 * @author Lappi
	 */
	public class Player extends GameSprite
	{
		
private var count:int = 0;


	
		
		[Embed(source = "../sprite/assets/tennisguy.png")] private var playerPNG:Class;
		public function Player(X:Number, Y:Number)
		{
			super(X, Y);
			
			strength = 200;
			isPlayer = true;
			targets = Registry.enemies;
			
			loadGraphic(playerPNG, true, true, 30, 21, true);
			
			facing = FlxObject.RIGHT;
			width = 12;
			height = 21;
			offset.x=9
		
			
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [3,4,5,6,10,11,12,13],13, true);
			addAnimation("flap", [9, 8], 15, false);
			addAnimation("jump", [8],15, false);
			addAnimation("fall", [9],15,false);
			addAnimation("invisible", [3], 0, false);
			addAnimation("swing", [2], 0, false);
			addAnimation("hurt", [3], 0, false);
			addAnimation("stop", [9], 0, false);
			addAnimation("charge", [1], 0, false);
			addAnimation("maxCharge", [1], 0, false);
			
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			//TODO make this work with  state system maybe take away flxcontrols, just make it with normal shit
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			FlxControl.player1.setJumpButton("UP", FlxControlHandler.KEYMODE_PRESSED, 
			200, FlxObject.FLOOR, 0, 0, null, "");
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			FlxControl.player1.setGravity(0, 400);
			
			
		}
		override public function update():void {
			health = 2;
			
			if (touching != FlxObject.FLOOR)
				state.jump();
			else if (FlxG.keys.LEFT||FlxG.keys.RIGHT)
				state.walk();
			
			state.animate();
			
			
			
			
		}
		
	}
}

