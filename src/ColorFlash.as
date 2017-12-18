package 
{
	import flash.display.Sprite;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oskar
	 */
	public class ColorFlash 
	{
		private var spr:FlxSprite;
		private var sprites:FlxGroup=new FlxGroup;
		private var clr:uint;
		public var red:uint;
		public var green:uint;
		public var blue:uint;
		public var oldclr:uint = 0xff000000;
		public var brightness:Number;
		public var blinkrate:Number;
		public var colorOff:Number;
		public var x:Number=0;
		public function ColorFlash(spr:FlxSprite,red:uint=0,green:uint=0,blue:uint=0,brightness:Number=0,blinkrate:Number=1,colorOff:Number=0) 
		{
			sprites.add(spr);
			
			this.red = red;
			this.green = green;
			this.blue = blue;
			this.blinkrate = blinkrate;
			this.brightness = brightness;
			this.colorOff = colorOff;
		}
		public function addSprite(spr:FlxSprite):void {
			sprites.add(spr);
			
		}
		public function removeSprite(spr:FlxSprite):void {
			sprites.remove(spr);
		}
		public function setFlxGroup(group:FlxGroup) {
			sprites = group;
		}
		public function update():void {
			x++;
			
			clr= 0xff000000 + uint("0x"+(
			(Math.floor(Math.sin( x/blinkrate ) *( red - brightness))+brightness-1)*Math.pow(16,4)
			+ (Math.floor(Math.sin( x/blinkrate+colorOff ) * (green -brightness))+brightness-1)*Math.pow(16,2)
			+ Math.floor(Math.sin(  x/blinkrate+colorOff*2 ) * (blue- brightness))+brightness-1
			).toString(16));
			for each(var spr:FlxSprite in sprites.members)
			spr.replaceColor(oldclr, clr);
			oldclr = clr;
		}
	}

}