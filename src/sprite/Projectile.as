package sprite {
	import org.flixel.FlxSprite;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Lappi
	 */
	public class Projectile  extends FlxSprite
	{
		public var weight:Number = 1;
		public var spin:int=0;
		
		public function Projectile(X:Number,Y:Number,SimpleGraphic:Class=null) 
		{super(X, Y,SimpleGraphic);
			
		}
		override public function update():void {
			super.update();
			if (touching==FlxObject.FLOOR&&spin != 0) {
				velocity.x = velocity.x +velocity.x*1.5*spin;
				spin = 0;
			}
			
			if (velocity.x > 0)
			angle=Math.atan(velocity.y / velocity.x) * 180 / Math.PI;
			else
			angle=Math.atan(velocity.y / velocity.x) * 180 / Math.PI+180;
			
		}
		
		public function justHit():void{
	
		}
		
	}

}