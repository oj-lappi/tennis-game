
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
public var torso:FlxSprite;


	
		
		[Embed(source = "../sprite/assets/tennisguy.png")] private var playerPNG:Class;
		[Embed(source = "../sprite/assets/Torso.png")] private var torsoPNG:Class;
		[Embed(source = "../sprite/assets/Legs.png")] private var legPNG:Class;
		public function Player(X:Number, Y:Number)
		{
			super(X, Y);
			
			strength = 200;
			isPlayer = true;
			targets = Registry.enemies;
			
			loadGraphic(legPNG, true, true, 30, 21,true);
			torso = new FlxSprite(X, Y);
			torso.loadGraphic(torsoPNG, true, true, 30, 21);
			
			facing = FlxObject.RIGHT;
			width = 12;
			height = 21;
			offset.x = 9
		
			torso.width = width;
			torso.height = height;
			torso.offset = offset;
		
			
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [3,4,5,6,10,11,12,13],13, true);
			addAnimation("flap", [9, 8], 15, false);
			addAnimation("jump", [8]);
			addAnimation("fall", [9]);
			addAnimation("jumphalf", [15]);
			addAnimation("fallhalf", [16]);
			addAnimation("invisible", [3]);
			addAnimation("swing", [2]);
			addAnimation("hurt", [3], 0, false);
			addAnimation("stop", [9], 0, false);
			addAnimation("charge", [1], 0, false);
			addAnimation("maxCharge", [1], 0, false);
			torso.addAnimation("idle",[0],0,false);
			torso.addAnimation("walk", [0, 3], 3);
			torso.addAnimation("charge", [1], 0, false);
			torso.addAnimation("maxCharge", [1], 0, false);
			torso.addAnimation("swing",[2],0,false);
			
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
			
			Registry.playerLayer.add(this);
			Registry.playerLayer.add(torso);
		}
		override public function update():void {
			health = 2;
			
			if (touching != FlxObject.FLOOR) {
				
				state.jump();
				
			}
				
			else if (FlxG.keys.LEFT||FlxG.keys.RIGHT){
				state.walk();
			}

			
			state.animate();
			
			
			
		}
		
	}
}


	