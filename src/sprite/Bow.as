package sprite {
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Bow extends FlxSprite
	{
		public var shooting:Boolean;
		public var charging:Boolean;
		public var up:Boolean = false;
		public var cooldown:int=0;
		[Embed(source = "../sprite/assets/Bow.png")] private var bowPNG:Class;
		public function Bow(X:Number, Y:Number)
		{
			
			super(X, Y);
			
			
			loadGraphic(bowPNG, true, true, 20, 20, true);
			
			width = 20;
			height = 20;
			offset.x = 5;
			offset.y = 2;
		
			addAnimation("idle", [0], 0, false);
			addAnimation("idleUp", [5], 0, false);
			addAnimation("charge", [1], 0, false);
			addAnimation("chargeUp", [6], 0, false);
			addAnimation("shoot", [2,3,4,0], 20, false);
			addAnimation("shootUp", [7,8,9,5], 20, false);
			addAnimation("invis", [], 0, false);
			
		
		
			facing = FlxObject.RIGHT;
		}
		override public function update():void
		{
			super.update();
		
			if (up)
			if (charging)
			play("chargeUp");
			else if (shooting) {
				 play("shootUp");
			}
			else
			play("idleUp");
			
			else if (charging)
			play("charge");
			else if (shooting) {
				 cooldown--;
				if (cooldown == 0)
				shooting = false;
				 play("shoot");
				
				 		if (cooldown == -1)
					cooldown = 7;
					
				
			}
			else
			play("idle");
			
		
		}
	}

}