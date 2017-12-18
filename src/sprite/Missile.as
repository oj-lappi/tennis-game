package sprite 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Missile extends FlxSprite 
	{
		private var shine:Shine;
			[Embed(source = "../sprite/assets/Missile.png")] private var missilePNG:Class;
		private var collisionY:Number;
		public function Missile(X:Number, Y:Number,velocity:FlxPoint) 
		{
			
			super(X, Y);
			loadGraphic(missilePNG, true, false, 68, 127, false);
			this.velocity = velocity;
			shine=new Shine(x, y);
			Registry.effects.add(shine);
			angle = Math.atan(-velocity.x / velocity.y) * 180 / Math.PI;
			shine.angle = angle;
		
			
		}
		override public function update():void {
			
			shine.x = x;
			shine.y = y;
			
			if (drag.y==0&&overlaps(Registry.room)) {
				collisionY = y + 127;
				Registry.backgroundLayer.add(new SideRubble(getMidpoint().x-20, collisionY,1));
				Registry.backgroundLayer.add(new SideRubble(getMidpoint().x-40,collisionY,-1));
			
				shine.stop = true;
				drag = new FlxPoint(Math.abs(velocity.x*3) , velocity.y*3);
			
				
			}
			
		
		}
		override public function postUpdate():void {
			super.postUpdate();
			shine.velocity = velocity;
			shine.x = x;
			shine.y = y;
		}
		
		
		
	}
		

}