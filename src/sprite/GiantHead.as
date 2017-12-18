package sprite 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oskar Lappi
	 */
	public class GiantHead extends GameSprite 
	{
		[Embed(source = "assets/Bjorn.png")]private var bjornPNG:Class;
		private var  blinking:Boolean = false;
		private var a:int = 0;
		private var yOrg:int;
		private var isSpeaking:Boolean = false;
		private var sb:SpeechBubble;
		public function GiantHead(X:Number, Y:Number, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			yOrg = y;
			loadGraphic(bjornPNG, true, true, 69, 67, false);
			addAnimation("talk", [0, 1, 2, 1, 3], 12);
			addAnimation("blink", [0, 4,5,4,3],12,false);
			play("talk") ;
			
		}
		override public function update():void {
		a++;
		y += +Math.sin(a / 8 / Math.PI) * .7;
		facing = getMidpoint().x < Registry.player.getMidpoint().x?LEFT:RIGHT; 
		var d:int=(Registry.player.getMidpoint().x - getMidpoint().x) * .01;
		x +=(Registry.player.getMidpoint().x - getMidpoint().x) * .01
		
		if (finished) {
		var anim:String = Math.random() > .8?"blink":"talk";
		play(anim)
		}
		var b:int = Math.random() * 40
		if (!isSpeaking ) {
		if( b > 36) {
			isSpeaking = true;
			var s:String;
		switch(b) {
		case 37:
			s = "ARE YOU HAVING A GOOD TIME";
			break;
		case 38:
			s = "I REMEMBER SLAYING THIS MCENROE KID ";
			break;
		case 39:
			s = "<3";
			break;
		default:
			s = "...";
		}
		sb=new SpeechBubble(s, this)
		Registry.effects.add(sb);
		}
		}else if (!sb.exists)
		isSpeaking = false;
	}

}
}