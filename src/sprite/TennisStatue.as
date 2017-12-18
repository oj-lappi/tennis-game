package sprite 
{
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Lappi
	 */
	public class TennisStatue extends FlxSprite
	{
		
		private var swinging:Boolean = false;
		private var sign:int;
		private var counter:int = 0;
		[Embed(source = "../sprite/assets/TennisStatue.png")] private var statuePNG:Class;
		public function TennisStatue(X:Number, Y:Number,facing:uint)
		{
		super(X, Y);
		loadGraphic(statuePNG, true, true, 62, 30, false);
	
		addAnimation("idle", [1], 0, false);
		addAnimation("swing", [0], 0, false);
		immovable = true;
		this.facing = facing;
		sign= (facing == FlxObject.LEFT? -1:1);
		}
		
	
	override public function update():void {
		
			for each(var pro:Projectile in Registry.projectiles.members ) {
				if (FlxG.overlap(this, pro)) {
					
					
					
					swinging = true;
					play("swing");
					pro.velocity.x = sign * 150;
				
					pro.justHit();
					
					break;
				}
				
			}
			if (!swinging)
			play("idle");
			else{
				play("swing");
				counter++;
				if (counter > 10){
					swinging = false;
					counter = 0;
				}
			}
			

		}
	}
}