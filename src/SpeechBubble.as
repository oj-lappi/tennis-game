package 
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxPoint;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import sprite.GameSprite;
	/**
	 * ...
	 * @author Oskar Lappi
	 */
	public class SpeechBubble extends FlxGroup 
	{
		
		private var text:FlxText;
		private var time:uint;		
		private var alpha:Number = 1;
		private var width:uint;
		private var height:uint;
		private var spr:GameSprite;
		private const SIZECONST:int = 8;
		private var den:int;
		private var clrflsh:ColorFlash;
		private const STAYVISIBLE:int = 0;
		
		
		public function SpeechBubble(str:String, spr:GameSprite, time:uint = 200) {
			this.time = time;
			den = time;
			
			this.spr = spr;
			width = str.length * SIZECONST;
			height = Math.floor(Math.ceil(width/100))*SIZECONST*1.7;
			width = width > 100?100:width;
		
			
			add(new FlxSprite(spr.x, spr.y - height - 10 ));
			add(new FlxSprite(spr.x+width/16, spr.y - height - 10 ));
			add(new FlxSprite(spr.x+1,spr.y-height-9 ));
			text = new FlxText(spr.x+2,spr.y-height-8, width -4, str);
			
			add(text);
			
			members[0].makeGraphic(width, height, 0xff72c962);
			members[1].makeGraphic(8, 8, 0xff000000,true);//0xff45ddf4);
			clrflsh = new ColorFlash(members[1],69,112,132,100,20);
			members[2].makeGraphic(width - 2, height - 2, 0xff000000);//457084
			text.color = 0xffd6ff88;
			//members[1].angle = 45;
			clrflsh.addSprite(members[2]);
		}
	
		
		override public function update():void {
			super.update();
			if(time!=STAYVISIBLE){
			time--;
			for each(var a:FlxSprite in members) {
				a.alpha = .2+time/den;
			
			}
			}
				members[0].x += (spr.x+spr.width/2 - members[0].x) * .2
				members[0].y += (spr.y -height - 10 - members[0].y) * .2
				
					
				members[1].x += (spr.x +spr.width/2+4 -members[1].x) * .2
				members[1].y += (spr.y -10 - members[1].width / 2 - members[1].y) * .2
				//members[1].alpha = members[1].alpha/2
				//we could do replaceColor on this ;D
				clrflsh.update();
					
				members[2].x += (spr.x+spr.width/2 +1- members[2].x) * .2
				members[2].y += (spr.y -height-9 - members[2].y) * .2
				
				members[3].x += (spr.x+spr.width/2+2 - members[3].x) * .2
				members[3].y += (spr.y-height-9 - members[3].y) * .2
			if (time <50)
			kill();
		}
		
	}

}